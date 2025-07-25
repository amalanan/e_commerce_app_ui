import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }


  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;

  static CartProvider of(BuildContext context, {
    bool listen = true,}) {
    return Provider.of<CartProvider>(
        context, listen: listen
    );
  }
  getTotalPrice(){
    double total = 0.0;
    for (Product element in _cart){
      total += element.price * element.quantity;
    }
    return total;
  }


}
