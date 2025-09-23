import 'package:flutter/material.dart';
import 'package:provider_test/consts.dart';

class CartProvider extends ChangeNotifier{
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void add(Product item){
    _cart.add(item);
    notifyListeners();
  }

  void remove(Product item){
    _cart.remove(item);
    notifyListeners();
  }

  void removeAll(){
    _cart.clear();
    notifyListeners();
  }

  double getCartTotal(){
    return _cart.fold(0, (previousValue, item) => previousValue + item.price);
  }
}