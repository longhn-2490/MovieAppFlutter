
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enum.dart';
import 'navigation_bar_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(navbarItem: NavbarItem.home));

  void setTab(int index) => getNavBarItem(index);

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(const NavigationState(navbarItem: NavbarItem.home));
        break;
      case 1:
        emit(const NavigationState(navbarItem: NavbarItem.discover));
        break;
      case 2:
        emit(const NavigationState(navbarItem: NavbarItem.show));
        break;
      case 3:
        emit(const NavigationState(navbarItem: NavbarItem.favorite));
        break;
    }
  }
}