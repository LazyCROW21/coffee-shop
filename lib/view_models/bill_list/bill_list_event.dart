part of 'bill_list_bloc.dart';

@immutable
sealed class BillListEvent {}

class AddBill extends BillListEvent {
  final Bill bill;
  AddBill({required this.bill});
}
