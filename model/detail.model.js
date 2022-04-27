import db from '../utils/db.js';

export default {
  add(entity) {
    return db('orderdetails').insert(entity);
  },
  getDetailHistory(OrderID) {
    return db("orderdetails")
      .where("OrderID", OrderID)
      .join("products as sp", { "orderdetails.ProID": "sp.ProID" })
      .select(
        "orderdetails.ProID",
        "sp.ProID",
        "sp.Price",
        "orderdetails.Quantity",
        "orderdetails.Amount"
      );
}
}

