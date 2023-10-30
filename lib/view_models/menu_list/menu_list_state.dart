part of 'menu_list_bloc.dart';

abstract class MenuListState {
  List<MenuItem> menuItems;
  bool isLoading;
  MenuListState({required this.menuItems, required this.isLoading});
}

class MenuListInitial extends MenuListState {
  MenuListInitial({required List<MenuItem> menuItems})
      : super(menuItems: menuItems, isLoading: false);
}

class MenuListUpdated extends MenuListState {
  MenuListUpdated({required List<MenuItem> menuItems})
      : super(menuItems: menuItems, isLoading: false);
}

class MenuListLoading extends MenuListState {
  MenuListLoading({required List<MenuItem> menuItems})
      : super(menuItems: menuItems, isLoading: true);
}
