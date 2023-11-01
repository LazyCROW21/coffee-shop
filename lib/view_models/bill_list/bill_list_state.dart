part of 'bill_list_bloc.dart';

@immutable
sealed class BillListState {
  final List<Bill> bills;
  const BillListState({required this.bills});
}

final class BillListInitial extends BillListState {
  const BillListInitial({required List<Bill> bills}) : super(bills: bills);
}

final class BillListUpdated extends BillListState {
  const BillListUpdated({required List<Bill> bills}) : super(bills: bills);
}
