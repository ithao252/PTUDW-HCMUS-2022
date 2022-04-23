import productModel from '../model/product.model.js';
import express from 'express';
const router = express.Router();

router.get('/', async function (req, res) {
  const list = await productModel.findAll();
  res.render('vwProduct/index', {
    products: list
  });
});
  
// router.get('/add',(req,res) => {
//     res.render('vwCategory/add');
//   });
  
// router.post('/add',async (req,res) => {
//    const ret= await categoryModel.add(req.body);
//    console.log(ret);
//     res.render('vwCategory/add');
//   });
// router.get('/edit', async (req,res)=>{
//   const id=req.query.id || 0;//khong truyen gi thi id tra ve gia tri 0
//   const category= await categoryModel.findById(id);
//   if(category === null){
//     return res.redirect('/admin/categories');
//   }
//  res.render('vwCategory/edit',{
//     category
//   });
// });

// router.post('/del',async (req,res) => {
//   const ret= await categoryModel.del(req.body.CatID);
//   console.log(ret);
//    res.redirect('/admin/categories');
//  });

//  router.post('/patch',async (req,res) => {
//   const ret= await categoryModel.patch(req.body);
//   console.log(ret);
//    res.redirect('/admin/categories');
//  });


  export default router;