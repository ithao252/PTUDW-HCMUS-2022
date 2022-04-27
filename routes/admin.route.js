import express from "express"
import moment from 'moment'
import multer from 'multer'
import productModel from "../model/product.model.js";
import numeral from "numeral";
import fs from 'fs';
import categoryModel from "../model/category.model.js";
import sendMail from "../utils/sendMail.js";
const router = express.Router();



router.get('/updateCategory', async function (req, res) {
    const listCategory = await categoryModel.findCategory();
    const listCategoryNext = await categoryModel.findCategoryNext();
    const listProduct = await productModel.findByOffset(6,0);

    for (const product of listProduct) {
        product.NameCatIDNext = await categoryModel.findByCatIDNext(product.CatIDNext);
    }

    res.render('vwCategory/updateCategory', {
        layout:'main.hbs',
        isAdmin: true,
        isUpdateCategory: true,
        listCategory,
        listCategoryNext,
        listProduct
    });
});

router.get('/updateCategory/addMain',async function (req, res) {
    const listCategory = await categoryModel.findCategory();
    const CatID = +listCategory[listCategory.length - 1].CatID + 1;
    res.render('vwCategory/addMainCategory', {
        layout: 'main.hbs',
        CatID
    });
});

router.post('/updateCategory/addMain',async function (req, res) {
    await categoryModel.addCategory(req.body);
    res.redirect('/admin/updateCategory')
});


router.get('/updateCategory/addSub', async function (req, res) {
    const listCategory = await categoryModel.findCategory();
    res.render('vwCategory/addSubCategory', {
        layout: 'main',
        listCategory
    });
});
router.post('/updateCategory/addSub', async function (req, res) {
    req.body.CatID = +req.body.CatID;
    req.body.CatIDNext = await categoryModel.findCategoryNextID();
    await categoryModel.addSubCategory(req.body);
    res.redirect('/admin/updateCategory');
});

router.get('/updateCategory/patchMainCat/:CatID', async function (req, res) {
    const CatID = req.params.CatID;
    const listCategory = await categoryModel.findCategory();
    const CatName = listCategory[CatID-1].CatName;
    res.render('vwCategory/patchMainCategory', {
        layout: 'main.hbs',
        CatID,
        CatName
    });
});
router.post('/updateCategory/patchMainCat/:CatID', async function (req, res) {
    await categoryModel.patchMainCategory(req.body);
    res.redirect('/admin/updateCategory');
});

router.get('/updateCategory/patchSubCat/:CatIDNext', async function (req, res) {
    const CatIDNext = req.params.CatIDNext;
    const CatID = await categoryModel.findCatIDByCatIDNext(CatIDNext);
    const listCategory = await categoryModel.findCategory();
    for (let list of listCategory){
        if (list.CatID === CatID){
            list.selected = true;
        }
    }
    const CatNextName = await categoryModel.findByCatIDNext(CatIDNext);
    res.render('vwCategory/patchSubCategory', {
        layout: 'main',
        listCategory,
        CatNextName
    });
});
router.post('/updateCategory/patchSubCat/:CatIDNext', async function (req, res) {
    req.body.CatID = +req.body.CatID;
    req.body.CatIDNext = req.params.CatIDNext;
    await categoryModel.patchSubCategory(req.body);
    res.redirect('/admin/updateCategory');
});


router.post('/delCatNext/:CatIDNext', async function (req, res) {
    const CatIDNext = req.params.CatIDNext;
    await categoryModel.delCatIDNext(CatIDNext);

    const url = req.headers.referer || '/';
    res.redirect(url);
});

router.post('/delCat/:CatID', async function (req, res) {
    const CatID = req.params.CatID;
    await categoryModel.delCatID(CatID);

    const url = req.headers.referer || '/';
    res.redirect(url);
});


router.get('/upload',async function (req,res){
    const listCategoryNext = await categoryModel.findCategoryNext();
    res.render('vwAdmin/uploadProduct',{
        layout:'auth',
        isUpload: true,
        listCategoryNext
    });
});



router.post('/upload',async function (req, res) {
    let count = await productModel.countProduct();
    count = count[0].count + 1;
    const dir = './public/product/'+count;

    console.log(count,dir)
    if (!fs.existsSync(dir)){
        fs.mkdirSync(dir, { recursive: true });
    }

    const des = count;
    let iterator = 1;

    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, './public/product/'+des);
        },
        filename: function (req, file, cb) {
            cb(null, iterator++ +'.png');
        }
    });

    const upload = multer({ storage: storage })
    upload.array('image',7)(req, res, function(err){
        console.log(req.body)
        const DateEnd = moment(req.body.DateEnd,'DD/MM/YYYY HH:mm').format('YYYY-MM-DD HH:mm:ss');
        if(err){
            console.log(err);
        }else {
            const product = {
                ProID: +count,
                ProName: req.body.name,
                Price: req.body.Price,
                DateEndDis: DateEnd,
                Description: req.body.FullDesc,
                CatIDNext:req.body.catIdNext,
            }

            productModel.addProduct(product)

            // res.render('vwSeller/sellProduct',{
            //     layout:'SignUp_Login',
            // });
            res.redirect('/admin/upload');
        }
    });

  
    
    router.get('/loadmore', async function (req, res) {
        const offset = req.query.offset;
        const list = await productModel.findByOffset(6,(offset)*6);
    
        for (const product of list) {
            product.NameCatIDNext = await categoryModel.findByCatIDNext(product.CatIDNext);
            product.Price = await numeral(product.Price).format('0,0');
        }
        res.json(list);
    });
    
    

   
});
export default router;