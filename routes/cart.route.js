import express from 'express';
import moment from 'moment';

import cartModel from '../model/cart.model.js';
import orderModel from '../model/order.model.js';
import detailModel from '../model/detail.model.js';
import productModel from '../model/product.model.js';

const router = express.Router();

router.get('/', async function (req, res) {
  const items = [];
  for (const cartElement of req.session.cart) {
    const product = await productModel.findByProID(cartElement.id);
    items.push({
      product,
      quantity: cartElement.quantity,
      amount: product.Price * cartElement.quantity
    });
  }

  res.render('vwCart/index', {
    items,
    empty: items.length === 0
  })
});

router.post('/add', async function (req, res) {
  const item = {
    id: +req.body.id,
    quantity: +req.body.quantity
  }

  cartModel.add(req.session.cart, item);
  res.redirect(req.headers.referer);
});
router.post('/minus', async function (req, res) {
  cartModel.minus(req.session.cart, +req.body.txtMinusProID);
  res.redirect(req.headers.referer);
});

router.post('/del', async function (req, res) {
  cartModel.del(req.session.cart, +req.body.id);
  res.redirect(req.headers.referer);
});

router.post("/checkout", async function (req, res) {
  let total = 0;
  const details = [];

  for (const cartElement of req.session.cart) {
    const product = await productModel.findByProID(cartElement.id);
    const amount = product.Price * cartElement.quantity;
    total += amount;

    details.push({
      OrderID: 0,
      ProID: product.ProID,
      Price: product.Price,
      Quantity: cartElement.quantity,
      Amount: amount,
    });
  }

  // const list = await orderModel.findAll();

  // const id = list.length + 1;

  const order = {
    OrderDate: moment().format("YYYY-MM-DD HH:mm:ss"),
    Total: total,
    UserID: req.session.authAccount.userId,
  };
  const ret= await orderModel.add(order);

  // const latest = await orderModel.getLatestOrder();

  // console.log(latest);

  // console.log(ret);
  for (const detail of details) {
    detail.OrderID = ret[0];
    await detailModel.add(detail);
  }
  console.log(details);
  req.session.cart = [];
  res.redirect(req.headers.referer);
});


export default router;