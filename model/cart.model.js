export default {
  add(cart, item) {
    for (const ci of cart) {
      if (ci.id === item.id) {
        ci.quantity += item.quantity;
        return;
      }
    }
    cart.push(item);
  },
  minus(cart, id) {
    for (const ci of cart) {
      if (ci.id === id) {
        if (ci.quantity > 1) {
          ci.quantity -= 1;
        }
        return;
      }
    }
  },
  del(cart, id) {
    for (let i = cart.length - 1; i >= 0; i--) {
      if (id === cart[i].id) {
        cart.splice(i, 1);
      }
    }
  },
  getNumberOfItems(cart) {
    let n = 0;
    for (const ci of cart) {
      n += ci.quantity;
    }
    return n;
  },
};