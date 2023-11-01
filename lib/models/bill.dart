import 'package:coffee_shop/models/cart_item.dart';

class Bill {
  final List<CartItem> items;
  final DateTime orderDateTime;

  Bill({
    required this.items,
    required this.orderDateTime,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      items: json['items'] as List<CartItem>,
      orderDateTime: json['orderDateTime'] as DateTime,
    );
  }
}
