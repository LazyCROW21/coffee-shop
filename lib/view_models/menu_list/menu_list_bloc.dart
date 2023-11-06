import 'package:bloc/bloc.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/repositories/menu_item_repository.dart';
import 'package:meta/meta.dart';

part 'menu_list_event.dart';
part 'menu_list_state.dart';

// [
//   MenuItem(id: 1, title: 'A', stock: 4, price: 45.0, imgUrl: ''),
//   MenuItem(id: 2, title: 'B', stock: 2, price: 55.0, imgUrl: ''),
//   MenuItem(id: 3, title: 'C', stock: 1, price: 23.0, imgUrl: ''),
// ]

class MenuListBloc extends Bloc<MenuListEvent, MenuListState> {
  MenuItemRepository _itemRepository = MenuItemRepository();
  MenuListBloc()
      : super(
            MenuListInitial(menuItems: MenuItemRepository().loadFromDevice())) {
    on<AddMenuItem>((event, emit) {
      state.menuItems.add(event.menuItem);
      _itemRepository.saveMenuItem(event.menuItem);
      _itemRepository.saveToDevice(state.menuItems);
      emit(MenuListUpdated(menuItems: state.menuItems));
    });

    on<UpdateMenuItem>((event, emit) {
      for (int i = 0; i < state.menuItems.length; i++) {
        if (state.menuItems[i].id == event.menuItem.id) {
          state.menuItems[i] = event.menuItem;
          break;
        }
      }
      _itemRepository.saveToDevice(state.menuItems);
      emit(MenuListUpdated(menuItems: state.menuItems));
    });

    on<DeleteMenuItem>((event, emit) {
      state.menuItems.removeAt(state.menuItems
          .indexWhere((element) => element.id == event.menuItem.id));
      _itemRepository.saveToDevice(state.menuItems);
      emit(MenuListUpdated(menuItems: state.menuItems));
    });

    on<SetMenuListLoading>((event, emit) {
      state.isLoading = event.isLoading;
      emit(MenuListLoading(menuItems: state.menuItems));
    });
  }
}
