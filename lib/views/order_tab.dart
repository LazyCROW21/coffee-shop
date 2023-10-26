import 'package:coffee_shop/components/cart_list_tile.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:flutter/material.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  final _menuItem = [
    MenuItem(id: 1, title: 'A', price: 10),
    MenuItem(id: 1, title: 'A', price: 10),
    MenuItem(id: 1, title: 'A', price: 10),
    MenuItem(id: 1, title: 'A', price: 10),
    MenuItem(id: 1, title: 'A', price: 10),
    MenuItem(id: 1, title: 'A', price: 10),
    MenuItem(id: 1, title: 'A', price: 10),
    MenuItem(id: 1, title: 'A', price: 10),
  ];

  final _searchInput = TextEditingController();

  @override
  void dispose() {
    _searchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchInput,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _menuItem.length,
              itemBuilder: (context, index) => const CartListTile(),
            ),
          ),
        ],
      ),
    );
  }
}
