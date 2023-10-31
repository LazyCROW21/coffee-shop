part of 'cart_list_bloc.dart';

abstract class CartListState {
  HashMap<int, CartItem> cartItems;
  CartListState({required this.cartItems});
}

final class CartListInitial extends CartListState {
  CartListInitial({required HashMap<int, CartItem> cartItems})
      : super(cartItems: cartItems);
}

final class CartListUpdated extends CartListState {
  CartListUpdated({required HashMap<int, CartItem> cartItems})
      : super(cartItems: cartItems);
}
