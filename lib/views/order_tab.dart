import 'dart:async';

import 'package:coffee_shop/components/cart_list_tile.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/view_models/cart_list/cart_list_bloc.dart';
import 'package:coffee_shop/view_models/menu_list/menu_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  final _searchInput = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchInput.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchInput,
            onChanged: _onSearchChanged,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
          ),
          const Divider(),
          Expanded(child: Builder(
            builder: (blocContext) {
              final menuListState = blocContext.watch<MenuListBloc>().state;
              final cartListState = blocContext.watch<CartListBloc>().state;
              if (menuListState is MenuListLoading) {
                return const Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                );
              }
              if (menuListState.menuItems.isNotEmpty) {
                List<MenuItem> filteredItems =
                    menuListState.menuItems.where((element) {
                  return element.title?.contains(_searchInput.text) ?? false;
                }).toList();
                return ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (listContext, index) {
                      MenuItem currentItem = filteredItems.elementAt(index);
                      int qty =
                          cartListState.cartItems[currentItem.id ?? -1]?.qty ??
                              0;
                      return CartListTile(
                        orderItem: CartItem(item: currentItem, qty: qty),
                      );
                    });
              }

              return const Center(
                child: Text(
                  'Nothing to eat...',
                  style: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
