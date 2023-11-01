import 'dart:async';

import 'package:coffee_shop/components/menu_list_tile.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/view_models/menu_list/menu_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryTab extends StatefulWidget {
  const InventoryTab({super.key});

  @override
  State<InventoryTab> createState() => InventoryTabState();
}

class InventoryTabState extends State<InventoryTab> {
  final _searchInput = TextEditingController();
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
  }

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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchInput,
            onChanged: _onSearchChanged,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
          ),
          const Divider(),
          Expanded(
              child: BlocBuilder<MenuListBloc, MenuListState>(
            buildWhen: (menuStatePrevious, menuStateCurrent) {
              return true;
            },
            builder: (blocContext, state) {
              if (state is MenuListLoading) {
                return const Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                );
              }
              if (state.menuItems.isNotEmpty) {
                List<MenuItem> filteredItems = state.menuItems.where((element) {
                  return element.title?.contains(_searchInput.text) ?? false;
                }).toList();
                return ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (listContext, index) =>
                      MenuListTile(filteredItems[index]),
                );
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
