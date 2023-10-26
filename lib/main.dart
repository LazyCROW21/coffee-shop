import 'package:coffee_shop/views/cart_page.dart';
import 'package:coffee_shop/views/home_page.dart';
import 'package:coffee_shop/views/login_page.dart';
import 'package:coffee_shop/views/menu_item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/menu-item': (context) => const MenuItemPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
