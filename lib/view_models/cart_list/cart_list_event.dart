part of 'cart_list_bloc.dart';

@immutable
abstract class CartListEvent {}

class SaveCartItem extends CartListEvent {
  final CartItem cartItem;
  SaveCartItem({required this.cartItem});
}

// class IncreamentCartItemQty extends CartListEvent {
//   final int id;
//   IncreamentCartItemQty({required this.id});
// }

// class DecreamentCartItemQty extends CartListEvent {
//   final int id;
//   DecreamentCartItemQty({required this.id});
// }

class DeleteCartItem extends CartListEvent {
  final CartItem cartItem;
  DeleteCartItem({required this.cartItem});
}
