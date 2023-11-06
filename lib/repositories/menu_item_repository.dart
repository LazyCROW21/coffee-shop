import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:flutter/foundation.dart';

class MenuItemRepository {
  List<MenuItem> loadFromDevice() {
    if (kIsWeb) {
      final Storage _localStorage = window.localStorage;
      if (!_localStorage.containsKey('menuItems')) return [];
      List data = jsonDecode(_localStorage['menuItems'] ?? '') as List;
      return data.map((e) => MenuItem.fromJson(e)).toList();
    }
    return [];
    // if(Platform.isAndroid) {

    // }
  }

  void saveToDevice(List<MenuItem> menuItems) {
    if (kIsWeb) {
      final Storage _localStorage = window.localStorage;
      _localStorage['menuItems'] = menuItems.toString();
    }
  }

  List<MenuItem> fetchMenuItems() {
    return [];
  }

  MenuItem saveMenuItem(MenuItem newMenuItem) {
    newMenuItem.id = Random().nextInt(999999);
    return newMenuItem;
  }

  void deleteMenuItem(MenuItem deleteMenuItem) {}

  MenuItem updateMenuItem(MenuItem updateMenuItem) {
    return updateMenuItem;
  }
}
