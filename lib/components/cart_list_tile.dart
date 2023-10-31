import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/view_models/cart_list/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onPressed: () {
                BlocProvider.of<CartListBloc>(context).add(SaveCartItem(
                    cartItem: CartItem(item: widget.orderItem.item, qty: 1)));
              },
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.redAccent[20],
                  child: IconButton(
                    onPressed: () {
                      if (widget.orderItem.qty == 1) {
                        BlocProvider.of<CartListBloc>(context)
                            .add(DeleteCartItem(cartItem: widget.orderItem));
                      } else {
                        BlocProvider.of<CartListBloc>(context).add(SaveCartItem(
                            cartItem: CartItem(
                                item: widget.orderItem.item,
                                qty: widget.orderItem.qty - 1)));
                      }
                    },
                    icon: const Icon(Icons.remove),
                    color: Colors.red,
                  ),
                ),
                Text(
                  widget.orderItem.qty.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundColor: Colors.greenAccent[20],
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<CartListBloc>(context).add(SaveCartItem(
                          cartItem: CartItem(
                              item: widget.orderItem.item,
                              qty: widget.orderItem.qty + 1)));
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
