import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:flutter/material.dart';

class CartListTile extends StatefulWidget {
  const CartListTile({super.key});

  @override
  State<CartListTile> createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  CartItem orderItem = CartItem(item: MenuItem(), qty: 10);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: ClipRRect(
            child: Image.network(
          orderItem.item.imgUrl ?? '',
          height: 64,
          width: 64,
          loadingBuilder: (context, child, loadingProgress) =>
              const Icon(Icons.image),
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
        )),
        title: Text(orderItem.item.title ?? 'loading..'),
        subtitle:
            Text("Price: Rs. ${orderItem.item.price?.toString() ?? '--'}"),
        trailing: SizedBox(
          width: 108,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
              const Text('1'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
