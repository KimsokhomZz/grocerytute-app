import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //* list of items on sale
  final List _shopItems = [
    //* [itemName, itemPrice, itemImage, color]
    ["Avocado", "4.00", "assets/images/avocado-removebg.png", Colors.green],
    ["Banana", "2.50", "assets/images/banana-removebg.png", Colors.yellow],
    ["Chicken", "12.80", "assets/images/chicken-removebg.png", Colors.brown],
    ["Water", "1.00", "assets/images/water-removebg.png", Colors.blue],
  ];

  //* list of cart items
  final List _cartItems = [];

  //* getter
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  //! Method
  //* add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //* remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //* calculate total price
  String totalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
