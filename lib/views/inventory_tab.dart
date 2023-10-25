import 'package:coffee_shop/components/menu_list_tile.dart';
import 'package:coffee_shop/models/item.dart';
import 'package:flutter/material.dart';

class InventoryTab extends StatefulWidget {
  const InventoryTab({super.key});

  @override
  State<InventoryTab> createState() => InventoryTabState();
}

class InventoryTabState extends State<InventoryTab> {
  final _items = <MenuItem>[
    MenuItem(id: 1, title: 'A', stock: 4, price: 45.0, imgUrl: ''),
    MenuItem(id: 2, title: 'B', stock: 2, price: 55.0, imgUrl: ''),
    MenuItem(id: 3, title: 'C', stock: 1, price: 23.0, imgUrl: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (listContext, index) => MenuListTile(_items[index])),
    );
  }
}
