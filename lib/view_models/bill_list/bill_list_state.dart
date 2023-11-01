part of 'bill_list_bloc.dart';

abstract class BillListState {
  List<Bill> bills;
  BillListState({required this.bills});
}

class BillListInitial extends BillListState {
  BillListInitial({required List<Bill> bills}) : super(bills: bills);
}

class BillListUpdated extends BillListState {
  BillListUpdated({required List<Bill> bills}) : super(bills: bills);
}
