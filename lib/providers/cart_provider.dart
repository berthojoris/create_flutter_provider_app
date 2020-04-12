import 'package:flutter/material.dart';
import 'package:noteapp/models/todo_model.dart';

class CartProvider extends ChangeNotifier {
  List<TodoModel> cart = [];

  int get total => cart.length;

  void addProduct(product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(product) {
    cart.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  void clearCart() {
    cart = [];
    notifyListeners();
  }
}
