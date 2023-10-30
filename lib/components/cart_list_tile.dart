import 'package:coffee_shop/models/cart_item.dart';
import 'package:flutter/material.dart';

class CartListTile extends StatefulWidget {
  final CartItem orderItem;
  const CartListTile({required this.orderItem, super.key});

  @override
  State<CartListTile> createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: ClipRRect(
            child: Image.network(
          widget.orderItem.item.imgUrl ?? '',
          height: 64,
          width: 64,
          loadingBuilder: (context, child, loadingProgress) =>
              const Icon(Icons.image),
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
        )),
        title: Text(widget.orderItem.item.title ?? 'loading..'),
        subtitle: Text(
            "Price: Rs. ${widget.orderItem.item.price?.toString() ?? '--'}"),
        trailing: SizedBox(
          width: 108,
          child: Visibility(
            visible: widget.orderItem.qty > 0,
            replacement: ElevatedButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 8, horizontal: 0)),
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              child: const Text(
                '+ Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                Text(widget.orderItem.qty.toString()),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
