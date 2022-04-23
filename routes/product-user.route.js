import productModel from '../model/product.model.js';
import express from 'express';
const router = express.Router();

router.get('/byCat/:id', async function (req, res) {
 // const catId=req.query.id || 0;
  const catId=req.params.id || 0;
  for (const c of res.locals.lcCategories) {
    if (c.CatID === +catId) {
      c.isActive = true;
      break;
    }
  }
 
   const limit=6;
   const page=req.query.page || 1;
   const offset=(page-1)*limit;
   const total= await productModel.countByCatId(catId);
   let nPages=Math.floor(total/limit);
   if(total%limit>0){
     nPages++;
   }
  const pageNumbers=[];
  for(let i=1;i<=nPages;i++){
     pageNumbers.push({
        value:i,
        isCurrent: +page===i

     });
  }
   

   const list= await productModel.findPageByCatId(catId,limit,offset);
  res.render('vwProduct/byCat', {
    products: list,
    empty: list.length===0,
    pageNumbers,
    pageNext: {
      page: +page + 1,
      isVisible: (+page === 1 && nPages === 1) ? false : (+page === nPages ? false : true),
  },
    pagePrev: {
      page: +page - 1,
      isVisible: (+page === 1) ? false : true,
  }
  });
});
  
router.get('/detail/:id', async function (req, res) {
  // const catId=req.query.id || 0;
   const proId=req.params.id || 0;
   const product = await productModel.findById(proId);
   if(product==null){
     return res.redirect('/');
   }
   res.render('vwProduct/detail', {
     product,
     empty: product.length===0
   });
 });

  export default router;