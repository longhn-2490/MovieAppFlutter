
import 'package:equatable/equatable.dart';

import '../../../core/utils/enum.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;

  const NavigationState({this.navbarItem = NavbarItem.home});

  @override
  List<Object> get props => [this.navbarItem];
}
