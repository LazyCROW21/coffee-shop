import 'package:bloc/bloc.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:meta/meta.dart';

part 'cart_list_event.dart';
part 'cart_list_state.dart';

class CartListBloc extends Bloc<CartListEvent, CartListState> {
  CartListBloc() : super(CartListInitial(cartItems: [])) {
    on<CartListEvent>((event, emit) {
      on<AddCartItem>((event, emit) {
        state.cartItems.add(event.cartItem);
        emit(CartListUpdated(cartItems: state.cartItems));
      });

      on<UpdateCartItem>((event, emit) {
        for (int i = 0; i < state.cartItems.length; i++) {
          if (state.cartItems[i].item.id == event.cartItem.item.id) {
            state.cartItems[i] = event.cartItem;
            break;
          }
        }
        emit(CartListUpdated(cartItems: state.cartItems));
      });

      on<DeleteCartItem>((event, emit) {
        state.cartItems.removeAt(state.cartItems.indexWhere(
            (element) => element.item.id == event.cartItem.item.id));
        emit(CartListUpdated(cartItems: state.cartItems));
      });
    });
  }
}
