import 'package:coffee_shop/models/bill.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/repositories/bill_repository.dart';
import 'package:coffee_shop/view_models/cart_list/cart_list_bloc.dart';
import 'package:coffee_shop/views/bills_tab.dart';
import 'package:coffee_shop/views/inventory_tab.dart';
import 'package:coffee_shop/views/order_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 2;
  final _tabs = const [
    OrderTab(),
    InventoryTab(),
    BillsTab(),
  ];

  BillRepository _billRepository = BillRepository();

  Widget? _getFloatingButtons(BuildContext context) {
    switch (_selectedTab) {
      case 0:
        return FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
          child: Badge(
              backgroundColor: Colors.purple,
              label: BlocBuilder<CartListBloc, CartListState>(
                builder: (context, state) {
                  return Text(state.cartItems.length.toString());
                },
              ),
              child: const Icon(Icons.shopping_cart)),
        );
      case 1:
        return FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/menu-item');
          },
          child: const Icon(Icons.add),
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coffee Shop'), actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Load'),
                    onTap: () {
                      print(_billRepository.loadFromDevice());
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Save'),
                    onTap: () => _billRepository.saveToDevice([
                      Bill(items: [
                        CartItem(
                            item: MenuItem(
                                id: 1, title: 'Hello', price: 1.1, stock: 1),
                            qty: 1)
                      ], orderDateTime: DateTime.now())
                    ]),
                  ),
                  const PopupMenuItem(child: Text('Settings')),
                  PopupMenuItem(
                    child: const Text('Logout'),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                  )
                ])
      ]),
      body: _tabs[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        onTap: (value) => setState(() {
          _selectedTab = value;
        }),
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.warehouse), label: 'Inventory'),
          BottomNavigationBarItem(
              icon: Icon(Icons.adf_scanner_outlined), label: 'Bills')
        ],
      ),
      floatingActionButton: _getFloatingButtons(context),
    );
  }
}
