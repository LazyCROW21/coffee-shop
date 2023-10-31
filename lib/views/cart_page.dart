import 'package:coffee_shop/components/cart_list_tile.dart';
import 'package:coffee_shop/view_models/cart_list/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              BlocBuilder<CartListBloc, CartListState>(
                builder: (cartListContext, state) {
                  if (state.cartItems.isEmpty) return SizedBox.shrink();
                  double total = 0;
                  state.cartItems.forEach((key, value) {
                    total += value.qty * (value.item.price ?? 0);
                  });
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Rs. $total')
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<CartListBloc, CartListState>(
                  builder: (cartListContext, state) {
                    if (state.cartItems.isEmpty) {
                      return const Center(
                          child: Text(
                        'Nothing in cart..',
                        style: TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      ));
                    }
                    return ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, index) => CartListTile(
                        orderItem:
                            state.cartItems.entries.elementAt(index).value,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: BlocBuilder<CartListBloc, CartListState>(
                  builder: (cartListContext, state) {
                    return Visibility(
                      visible: state.cartItems.isNotEmpty,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.purple)),
                        onPressed: () {},
                        child: const Text(
                          'Confirm Order',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
