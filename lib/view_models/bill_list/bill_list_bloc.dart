import 'package:bloc/bloc.dart';
import 'package:coffee_shop/models/bill.dart';
import 'package:meta/meta.dart';

part 'bill_list_event.dart';
part 'bill_list_state.dart';

class BillListBloc extends Bloc<BillListEvent, BillListState> {
  BillListBloc() : super(const BillListInitial(bills: [])) {
    on<BillListEvent>((event, emit) {
      on<AddBill>((event, emit) {
        state.bills.add(event.bill);
        emit(BillListUpdated(bills: state.bills));
      });
    });
  }
}
