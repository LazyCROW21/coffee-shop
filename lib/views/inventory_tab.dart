import 'package:coffee_shop/components/menu_list_tile.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchInput,
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
                return ListView.builder(
                  itemCount: state.menuItems.length,
                  itemBuilder: (listContext, index) =>
                      MenuListTile(state.menuItems[index]),
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
