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
      items: (json['items'] as List).map((e) => CartItem.fromJson(e)).toList(),
      orderDateTime: DateTime.parse(json['orderDateTime']),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items.toString(),
        'orderDateTime': orderDateTime.toString(),
      };

  @override
  String toString() {
    return '{"items":${items.toString()},"orderDateTime":"${orderDateTime.toString()}"}';
  }
}
