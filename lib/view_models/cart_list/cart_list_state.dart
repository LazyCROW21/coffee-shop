part of 'cart_list_bloc.dart';

abstract class CartListState {
  List<CartItem> cartItems;
  CartListState({required this.cartItems});
}

final class CartListInitial extends CartListState {
  CartListInitial({required List<CartItem> cartItems})
      : super(cartItems: cartItems);
}

final class CartListUpdated extends CartListState {
  CartListUpdated({required List<CartItem> cartItems})
      : super(cartItems: cartItems);
}
