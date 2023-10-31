import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:meta/meta.dart';

part 'cart_list_event.dart';
part 'cart_list_state.dart';

class CartListBloc extends Bloc<CartListEvent, CartListState> {
  CartListBloc() : super(CartListInitial(cartItems: HashMap())) {
    on<CartListEvent>((event, emit) {
      on<SaveCartItem>((event, emit) {
        state.cartItems[event.cartItem.item.id ?? -1] = event.cartItem;
        emit(CartListUpdated(cartItems: state.cartItems));
      });

      // on<IncreamentCartItemQty>((event, emit) {
      //   state.cartItems[event.id]?.qty++;
      //   emit(CartListUpdated(cartItems: state.cartItems));
      // });

      on<DeleteCartItem>((event, emit) {
        state.cartItems.remove(event.cartItem.item.id);
        emit(CartListUpdated(cartItems: state.cartItems));
      });
    });
  }
}
