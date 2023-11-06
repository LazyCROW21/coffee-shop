import 'dart:convert';
import 'dart:html';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class CartRepository {
  List<CartItem> loadFromDevice() {
    if (kIsWeb) {
      final Storage _localStorage = window.localStorage;
      if (!_localStorage.containsKey('cart')) return [];
      List data = jsonDecode(_localStorage['cart'] ?? '') as List;
      return data.map((e) => CartItem.fromJson(e)).toList();
    }
    return [];
    // if(Platform.isAndroid) {

    // }
  }

  void saveToDevice(List<CartItem> cart) {
    if (kIsWeb) {
      final Storage _localStorage = window.localStorage;
      _localStorage['cart'] = cart.toString();
    }
  }

  List<CartItem> fetchCartItems() {
    return [];
  }

  CartItem saveCartItem(CartItem newCartItem) {
    return newCartItem;
  }

  void deleteCartItem(CartItem deleteCartItem) {}

  CartItem updateCartItem(CartItem updateCartItem) {
    return updateCartItem;
  }
}
