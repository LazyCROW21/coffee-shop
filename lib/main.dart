import 'package:coffee_shop/view_models/cart_list/cart_list_bloc.dart';
import 'package:coffee_shop/view_models/menu_list/menu_list_bloc.dart';
import 'package:coffee_shop/views/cart_page.dart';
import 'package:coffee_shop/views/home_page.dart';
import 'package:coffee_shop/views/login_page.dart';
import 'package:coffee_shop/views/menu_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuListBloc>(create: (providerContext) => MenuListBloc()),
        BlocProvider<CartListBloc>(create: (providerContext) => CartListBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/menu-item': (routeContext) => MenuItemPage(
              ModalRoute.of(routeContext)!.settings.arguments as int?),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
