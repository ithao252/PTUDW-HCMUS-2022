import express from "express";
import bcrypt from 'bcrypt';
import userModel from "../model/user.model.js";
import moment from "moment";
import sendMail from "../utils/sendMail.js";
import generateOtp from "../utils/generateOTP.js";
import sliceURL from "../utils/sliceURL.js";
import numeral from "numeral";

// import {activeEmail} from '../middlewares/auth.mdw.js';

const router = express.Router();

router.get('/register', async function (req, res) {
 

    res.render('auth/signup', {
        layout: 'auth'
    });
});

router.post('/register', async function (req, res) {
    // if (req.body['g-recaptcha-response'] === undefined || req.body['g-recaptcha-response'] === '' || req.body['g-recaptcha-response'] === null) {
    //     return res.render('auth/signup', {
    //         layout: 'auth',
    //         reCapcha: "chưa xác thực"
    //     });
    // }
    const rawPassword = req.body.password;
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(rawPassword, salt);
    const dayOfBirth = moment(req.body.dayOfBirth, 'DD/MM/YYYY').format('YYYY-MM-DD');
    const account = {
        name: req.body.name,
        address: req.body.address,
        email: req.body.email,
        dob: dayOfBirth,
        username: req.body.username,
        password: hash,
        otp: generateOtp(4)
    }

    await userModel.addAccount(account);
    req.session.registerUser = req.body.email;
    req.session.username = req.body.username;
    res.redirect('/account/activeEmail');
});

router.get('/is-available', async function (req, res) {
    const username = req.query.username;
    const accountHasUsername = await userModel.findByUsername(username);
    const email = req.query.email;
    if (email === undefined) {
        if (accountHasUsername === null) {
            return res.json(false);
        }
        return res.json(true);
    }
    const accountHasEmail = await userModel.findByEmail(email);

    if (accountHasUsername === null && accountHasEmail === null) {
        return res.json(true);
    }

    const check = {username: true, email: true};
    if (accountHasUsername !== null) {
        check.username = false;
    }
    if (accountHasEmail !== null) {
        check.email = false;
    }

    return res.json(check);
});

router.get('/activeEmail', async function (req, res) {
    const email = req.session.registerUser;
    const user = await userModel.findByEmail(email);
    const content = 'Your OTP code: <b>' + user.otp + '</b>';
    sendMail(user.email, content);

    let resendOtp = false;
    if (req.query.resendOtp === 'true'){
        resendOtp = true;
    }
    res.render('auth/activeEmail', {
        layout: 'auth',
        resendOtp
    });
});

router.post('/activeEmail', async function (req, res) {
    const username = req.session.username;
    const entity = {
        username: username,
        isVerify: 1,
        otp: 'null'
    }
    await userModel.updateInfoAccount(entity);
    const user = await userModel.findByUsername(username);
    const content = 'Tài khoản ' + user.username + ' của bạn kích hoạt thành công. Chúng tôi sẽ sử dụng email này của bạn để liên hệ với bạn.' +
        'Cám ơn bạn đã sử dụng hệ thống của chúng tôi.';
    sendMail(user.email, content);
    
    res.redirect('/account/login');
});

router.get('/is-exist', async function (req, res) {
    const username = req.session.authAccount.username;
    const email = req.query.email;
    const accountHasEmail = await userModel.findByEmail(email);

    if (accountHasEmail === null || accountHasEmail.username === username) {
        return res.json(true);
    }
    return res.json(false);
});



router.get('/hasAccountLock', async function (req, res) {
    const list = await userModel.findAll();
    for (const account of list) {
        if (account.banned === 1) {
            return res.json(true);
        }
    }
    return res.json(false);
});

router.get('/is-password', async function (req, res) {
    const username = req.session.authAccount.username;
    const account = await userModel.findByUsername(username);

    const ret = bcrypt.compareSync(req.query.password, account.password);
    if (ret === true) {
        return res.json(true);
    }
    return res.json(false);
});

router.get('/is-otp', async function (req, res) {
    const username = req.session.username;
    const account = await userModel.findByUsername(username);
    if (+req.query.otp === account.otp) {
        return res.json(true);
    }
    return res.json(false);
});

router.get('/login', async function (req, res) {
    const prevURL = sliceURL(req.headers.referer);

    if (prevURL !== "/account/login/" && req.headers.referer !== "/favicon.ico"
        && prevURL !== "/account/register/" && prevURL !== "/account/login/forgotPassword/") {
        req.session.retUrl = req.headers.referer;
    }
    res.render('auth/login', {
        layout: 'auth'
    });
});

router.post('/login', async function (req, res) {
    const account = await userModel.findByUsername(req.body.username);

    if (account === null) {
        return res.render('auth/login', {
            layout: 'auth',
            errMessage: "Tài khoản hoặc mật khẩu sai",
        });
    }
    if (account.banned === 1) {
        return res.render('auth/login', {
            layout: 'auth',
            errMessage: "Tài khoản đã bị khóa",
        });
    }
    const ret = bcrypt.compareSync(req.body.password, account.password);
    if (ret === false) {
        return res.render('auth/login', {
            layout: 'auth',
            errMessage: "Tài khoản hoặc mật khẩu sai",
        });
    }

    delete account.password;

    req.session.auth = true;
    req.session.authAccount = account;
    req.session.cart = [];
   
    let url =  '/';

    res.redirect(url);
});

router.get('/login/forgotPassword', function (req, res) {
    res.render('auth/forgotPassword', {
        layout: 'auth'
    });
});

router.post('/login/forgotPassword', async function (req, res) {
    const username = req.query.username;
    const newPass = generateOtp(6) + '';
    //console.log(typeof newPass);
    //console.log(newPass);
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(newPass, salt);
    const entity = {
        username: username,
        password: hash
    }
    await userModel.updateInfoAccount(entity);

    const account = await userModel.findByUsername(username);

    const content = 'Mật khẩu mới của bạn là: <b>' + newPass + '</b><br/>Vui lòng thay đổi mật khẩu của bạn sau khi đăng nhập thành công. Nếu bạn không thay đổi mật khẩu sớm, chúng tôi không thể đảm bảo an toàn bảo mật cho bạn.'
    sendMail(account.email, content);

    res.redirect('/account/login');
});

router.post('/logout', async function (req, res) {

    req.session.auth = false;
    req.session.authAccount = null;

    const url = req.headers.referer || '/';

    res.redirect(url);
});
router.get('/infoHistory/:id', async function (req, res) {
    const username = req.params.id;
    const account = await accountModel.findByUsername(username);
    const list = await historybidModel.findListHistoryBidByUsername(username,0);
    const listSeller = await historybidModel.findListHistorySeller(username,0);
    let point_percent = 0;

    if(+account.sumBid === 0){
        point_percent = 0;
    } else if(account.sumBid>0){
        if(account.point === 0)
            point_percent = account.sumBid*-100;
        else
            point_percent = ((account.point)*100/account.sumBid).toFixed();
    }


    res.render('vwInfo/infoHistory', {
        layout: 'main',
        point: point_percent,
        isEmpty: list.length === 0,
        list,
        isBidder: account.level === "bidder",
        isEmptySold: listSeller.length === 0,
        listSeller,
        username
    });
});

router.get('/loadmoreBidder', async function (req, res) {
    const offset = req.query.offset;
    const username = req.query.username;

    const list = await historybidModel.findListHistoryBidByUsername(username,offset*2);
    let result = "****";

    for (const product of list) {

        if(product.Seller === null)
            product.SellerMask = "";
        else{
            product.SellerMask = product.Seller.substring(0,product.Seller.length/2) + result;
        }

        product.PriceWinAll = await numeral(product.PriceWinAll).format('0,0');
    }
    res.json(list);
});

router.get('/loadmoreSeller', async function (req, res) {
    const offset = req.query.offset;
    const username = req.query.username;

    const list = await historybidModel.findListHistorySeller(username,2*offset);
    let result = "****";

    for (const product of list) {
        if(product.Bidder === null)
            product.BidderMask = "";
        else{
            product.BidderMask = product.Bidder.substring(0,product.Bidder.length/2) + result;
        }
        product.PriceWinAll = await numeral(product.PriceWinAll).format('0,0');
    }
    res.json(list);
});

export default router