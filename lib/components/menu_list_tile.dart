import 'package:coffee_shop/models/menu_item.dart';
import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  final MenuItem _menuItem;
  const MenuListTile(this._menuItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: ClipRRect(
            child: Image.network(
          _menuItem.imgUrl ?? '',
          loadingBuilder: (context, child, loadingProgress) =>
              const Icon(Icons.image),
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
        )),
        title: Text(_menuItem.title ?? 'loading..'),
        subtitle: Text(
            "Price: Rs. ${_menuItem.price?.toString() ?? '--'} | Stock: ${_menuItem.stock?.toString() ?? 'loading..'}"),
      ),
    );
  }
}
