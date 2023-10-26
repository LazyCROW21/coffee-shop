import 'package:coffee_shop/components/cart_list_tile.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cartItems = ['1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        backgroundColor: Colors.pink[50],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) => const CartListTile(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Confirm Order'),
                ),
              ),
            ],
          ),
        ));
  }
}
