part of 'cart_list_bloc.dart';

@immutable
abstract class CartListEvent {}

class AddCartItem extends CartListEvent {
  final CartItem cartItem;
  AddCartItem({required this.cartItem});
}

class UpdateCartItem extends CartListEvent {
  final CartItem cartItem;
  UpdateCartItem({required this.cartItem});
}

class DeleteCartItem extends CartListEvent {
  final CartItem cartItem;
  DeleteCartItem({required this.cartItem});
}
