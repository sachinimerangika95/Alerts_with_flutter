import 'package:flutter/material.dart';

class ShopItemModel extends ChangeNotifier{
  //list of items on sale

  final List _travelItems = [
    ["Drone","120", "assets/images/Drone.png", Colors.green],
    ["Camera","100", "assets/images/DSLR_camera.png", Colors.yellow],
    ["Travel Bag","70", "assets/images/travel_bag.png", Colors.brown],
    ["Tent","90", "assets/images/camping_tent.png", Colors.blue],
  ];

  List _cartItems = [];

  get travelItems => _travelItems;

  get cartItems => _cartItems;

  // add items to cart

  void addItemToCart(int index){
    _cartItems.add(_travelItems[index]);
    notifyListeners();

  }

  // remove item from the cart
  void removeItemFromcart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal(){
    double totalPrice = 0;
    for (int i = 0; i <cartItems.lenght; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}