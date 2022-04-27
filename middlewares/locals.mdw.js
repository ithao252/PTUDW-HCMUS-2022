import categoryModel from "../model/category.model.js";
import moment from "moment";
import cartModel from "../model/cart.model.js";


export default function (app) {
    
    app.use(async function (req, res, next) {
   
        if (typeof (req.session.auth) === 'undefined') {
            req.session.auth = false;

        } else if (req.session.auth !== false) {
            const account = req.session.authAccount;
           


            if (account.role === 'user') {
                res.locals.User = true;
            } else if (account.role === 'admin')
                res.locals.Admin = true;

        }
        if (req.session.auth === false) {
            req.session.cart = [];
        }
        res.locals.auth = req.session.auth;
        res.locals.authAccount = req.session.authAccount;
        if (req.session.cart != null) {
            res.locals.cartSummary = cartModel.getNumberOfItems(req.session.cart);
          }
        next();
    });



    app.use(async function (req, res, next) {
        res.locals.lcCategories = await categoryModel.findAll();
        next();
    });
}