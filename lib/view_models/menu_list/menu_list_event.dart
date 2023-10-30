part of 'menu_list_bloc.dart';

@immutable
abstract class MenuListEvent {}

class AddMenuItem extends MenuListEvent {
  final MenuItem menuItem;
  AddMenuItem({required this.menuItem});
}

class UpdateMenuItem extends MenuListEvent {
  final MenuItem menuItem;
  UpdateMenuItem({required this.menuItem});
}

class DeleteMenuItem extends MenuListEvent {
  final MenuItem menuItem;
  DeleteMenuItem({required this.menuItem});
}

class SetMenuListLoading extends MenuListEvent {
  final bool isLoading;
  SetMenuListLoading({required this.isLoading});
}
