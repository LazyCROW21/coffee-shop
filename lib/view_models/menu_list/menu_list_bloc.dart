import 'package:bloc/bloc.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:meta/meta.dart';

part 'menu_list_event.dart';
part 'menu_list_state.dart';

class MenuListBloc extends Bloc<MenuListEvent, MenuListState> {
  MenuListBloc()
      : super(MenuListInitial(menuItems: [
          MenuItem(id: 1, title: 'A', stock: 4, price: 45.0, imgUrl: ''),
          MenuItem(id: 2, title: 'B', stock: 2, price: 55.0, imgUrl: ''),
          MenuItem(id: 3, title: 'C', stock: 1, price: 23.0, imgUrl: ''),
        ])) {
    on<AddMenuItem>((event, emit) {
      state.menuItems.add(event.menuItem);
      emit(MenuListUpdated(menuItems: state.menuItems));
    });

    on<UpdateMenuItem>((event, emit) {
      for (int i = 0; i < state.menuItems.length; i++) {
        if (state.menuItems[i].id == event.menuItem.id) {
          state.menuItems[i] = event.menuItem;
          break;
        }
      }
      emit(MenuListUpdated(menuItems: state.menuItems));
    });

    on<DeleteMenuItem>((event, emit) {
      state.menuItems.removeAt(state.menuItems
          .indexWhere((element) => element.id == event.menuItem.id));
      emit(MenuListUpdated(menuItems: state.menuItems));
    });

    on<SetMenuListLoading>((event, emit) {
      state.isLoading = event.isLoading;
      emit(MenuListLoading(menuItems: state.menuItems));
    });
  }
}
