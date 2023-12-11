import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodmenu = [
    Food(
      name: "Salmon Sushi",
      imagepath: "lib/assets/sushi2.png",
      price: "15",
      rating: "4.6",
      Description:
          "Savor the delicate elegance of salmon sushi, where the rich, velvety salmon dances with perfectly seasoned rice, creating a symphony of flavors that's simply irresistible. It's the ocean's gift to your palate, a bite-sized masterpiece that'll have you hooked with every mouthful!",
    ),
    Food(
      name: "Tuna",
      imagepath: "lib/assets/roll-fish.png",
      price: "20",
      rating: "6",
      Description:
          "Delight in the sheer perfection of tuna sushi, where the sublime richness of tender tuna meets the masterful touch of perfectly seasoned sushi rice, resulting in a taste sensation that's unparalleled. It's a culinary masterpiece that brings the deep sea to your plate, a bite-sized symphony of flavors that'll keep you coming back for more!",
    )
  ];
  //customer cart
  final List<Food> _cart = [];
  List<Food> get foodmenu => _foodmenu;
  List<Food> get cart => _cart;
  //add to cart
  void addtocart(Food fooditem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(fooditem);
    }
    notifyListeners();
  }

  //remove from cart
  void removefromcart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
