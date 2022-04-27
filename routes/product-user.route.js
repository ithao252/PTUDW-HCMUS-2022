import express, {request} from "express";
import productModel from "../model/product.model.js";
import productFavoriteModel from "../model/productFavorite.model.js";

import moment from "moment";
import sendMail from "../utils/sendMail.js";

const router = express.Router();

router.get('/infoProduct/:id', async function (req, res) {
    const id = req.params.id;
    const product = await productModel.findByProID(id);
    const isSold = await productModel.isSold(id);
    if(product[0].Status==="Hết hàng") {
      
            res.json("soldOut");
    }
        res.json(product[0]);
});


router.get('/byCat/:id', async function (req, res) {
    const CatIDNext = req.params.id || 0;

    //---
    const limit = 6;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = await productModel.countByCatIDNext(CatIDNext);
    let nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;

    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i
        });
    }

    

    const list = await productModel.findPageByCatIDNext(CatIDNext, limit, offset);
    for (const p of list) {
        p.auth = req.session.auth;
        p.isNew = await productModel.isNew(p.ProID, 10);
    }
    let found = false;
    for (const c of res.locals.lcCategories) {
        for (const tmp of c.listsub) {
            if (tmp.CatIDNext === +CatIDNext) {
                c.isActive = true;
                tmp.isActive = true;
                found = true;
                break;
            }
        }

        if (found)
            break;
    }
    if (req.session.auth) {
        const username = req.session.authAccount.username;
        for (const p of list) {
            p.isLiked = await productFavoriteModel.isFavorite(username, p.ProID);
        }
    }
    res.render('vwCategory/category', {
        layout: 'main',
        list,
        isEmpty: list.length === 0,
        pageNumbers,
        pageNext: {
            page: +page + 1,
            isVisible: (+page === 1 && nPages === 1) ? false : (+page === nPages ? false : true),
        },
        pagePrev: {
            page: +page - 1,
            isVisible: (+page === 1) ? false : true,
        },
    });
});


router.get('/detail/:id', async function (req, res) {
    const ProID = req.params.id;
    const product = await productModel.findByID(ProID);
    const listcomment = await productModel.findListComment(ProID);
    const relatives = await productModel.findRelatedProducts(ProID, product[0].CatIDNext);
    let isLiked = false;
    if (req.session.auth) {
        const username = req.session.authAccount.username;
        isLiked = await productFavoriteModel.isFavorite(username, ProID);
    }
    

    if (product === null) {
        return res.redirect('/');
    }
    res.render('vwCategory/product', {
        layout: 'auth',
        product: product[0],
        isLiked,
        listcomment,
        relatedProducts: relatives,
    });


});

router.post('/addComment', async function (req, res) {
  
    const time = moment().format('YYYY-MM-DD hh:mm:ss');
    const review = {
        username: req.session.authAccount.username,
        ProID: +req.body.id,
        time: time,
       comment: req.body.comment,
       
    }

    await productModel.addComment(review);
    
    res.redirect(req.headers.referer);
});


export default router;