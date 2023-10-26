import 'package:coffee_shop/models/menu_item.dart';

class CartItem {
  final MenuItem item;
  final int qty;

  CartItem({
    required this.item,
    required this.qty,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      item: json['item'] as MenuItem,
      qty: json['qty'] as int,
    );
  }
}
