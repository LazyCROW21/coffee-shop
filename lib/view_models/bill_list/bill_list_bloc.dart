import 'package:bloc/bloc.dart';
import 'package:coffee_shop/models/bill.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:meta/meta.dart';

part 'bill_list_event.dart';
part 'bill_list_state.dart';

class BillListBloc extends Bloc<BillListEvent, BillListState> {
  BillListBloc()
      : super(BillListInitial(bills: [
          Bill(items: [
            CartItem(
                item: MenuItem(
                    id: 1,
                    title: 'Cookies',
                    description: '',
                    stock: 10,
                    price: 71.5),
                qty: 4)
          ], orderDateTime: DateTime(2023, 11, 1, 8, 45))
        ])) {
    on<AddBill>((event, emit) {
      state.bills.add(event.bill);
      emit(BillListUpdated(bills: state.bills));
    });
  }
}
