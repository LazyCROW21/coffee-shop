import 'dart:convert';
import 'dart:html';
import 'package:coffee_shop/models/bill.dart';
import 'package:flutter/foundation.dart';

class BillRepository {
  List<Bill> loadFromDevice() {
    if (kIsWeb) {
      final Storage _localStorage = window.localStorage;
      if (!_localStorage.containsKey('bills')) return [];
      List data = jsonDecode(_localStorage['bills'] ?? '') as List;
      return data.map((e) => Bill.fromJson(e)).toList();
    }
    return [];
    // if(Platform.isAndroid) {

    // }
  }

  void saveToDevice(List<Bill> bills) {
    if (kIsWeb) {
      final Storage _localStorage = window.localStorage;
      _localStorage['bills'] = bills.toString();
    }
  }

  List<Bill> fetchBills() {
    return [];
  }

  Bill saveBill(Bill newBill) {
    return newBill;
  }

  void deleteBill(Bill deleteBill) {}

  Bill updateBill(Bill updateBill) {
    return updateBill;
  }
}
