import 'package:coffee_shop/components/cart_list_tile.dart';
import 'package:coffee_shop/models/cart_item.dart';
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
                  itemBuilder: (listContext, index) => CartListTile(
                    orderItem: CartItem(
                        item: state.menuItems.elementAt(index), qty: 0),
                  ),
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
