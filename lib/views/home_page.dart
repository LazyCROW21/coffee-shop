import 'package:coffee_shop/views/bills_tab.dart';
import 'package:coffee_shop/views/inventory_tab.dart';
import 'package:coffee_shop/views/order_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  final _tabs = const [
    OrderTab(),
    InventoryTab(),
    BillsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: 'HOME',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.warehouse), label: 'Inventory'),
          BottomNavigationBarItem(
              icon: Icon(Icons.adf_scanner_outlined), label: 'Bills')
        ],
      ),
      floatingActionButton: _selectedTab == 1
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
