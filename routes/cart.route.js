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
    const product = await productModel.findById(cartElement.id);
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

router.post('/del', async function (req, res) {
  cartModel.del(req.session.cart, +req.body.id);
  res.redirect(req.headers.referer);
});

router.post('/checkout', async function (req, res) {
  let total = 0;
  const details = [];
  for (const cartElement of req.session.cart) {
    const product = await productModel.findById(cartElement.id);
    const amount = product.Price * cartElement.quantity;
    total += amount;

    details.push({
      ProID: product.ProID,
      Quantity: cartElement.quantity,
      Price: product.Price,
      Amount: amount,
      OrderID: 0
    });
  }

  const order = {
    OrderDate: moment().format('YYYY-MM-DD HH:mm:ss'),
    UserID: req.session.authUser.id,
    Total: total
  }
  const ret = await orderModel.add(order);
  for (const detail of details) {
    detail.OrderID = ret[0];
    await detailModel.add(detail);
  }

  req.session.cart = [];
  res.redirect(req.headers.referer);
});

export default router;