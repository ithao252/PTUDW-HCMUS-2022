import { dirname } from 'path';
import { fileURLToPath } from 'url';
const __dirname = dirname(fileURLToPath(import.meta.url));

import productModel from "../model/product.model.js";
import searchRoute from "../routes/search.route.js";
import productUserRoute from "../routes/product-user.route.js";
import authRoute from "../routes/auth.route.js";
import infoRoute from "../routes/info.route.js";
import adminRoute from "../routes/admin.route.js";
import {auth,authAdmin} from './auth.mdw.js';
import cartRoute from "../routes/cart.route.js";

export default function (app) {
  app.get('/', async function (req, res) {
    const topClose = await productModel.findTopClose();
    const topSale = await productModel.findTopSale();
    const topCommended = await productModel.findTopCommended();
        let listID = '';
        for(let i = 0; i < topClose.length; i++){
            listID += topClose[i].ProID + ' ';
        }
        listID = listID.trim()
        

        res.render('home',{
            layout:'main.hbs',
            topClose,
            topSale,
            topCommended,
            listID
        });
  });

  app.get('/terms', async function (req,res){
    res.render('terms',{
        layout:'main.hbs'
    });
});
  
  app.get('/err', function (req, res) {
    throw new Error('Error!');
  });



  // app.use('/products', productUserRoute);
  app.use('/account', authRoute)
  app.use('/search',searchRoute);
  app.use('/product',productUserRoute);
  app.use('/info',infoRoute);
  app.use('/cart', auth, cartRoute);
  app.use('/admin', authAdmin, adminRoute);

  app.use(function (req, res, next) {
    res.render('404', { layout: false });
  });

  app.use(function (err, req, res, next) {
    console.error(err.stack)
    // res.status(500).send('Something broke!')
    res.render('500', { layout: false });
  });
}




