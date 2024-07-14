import 'package:flutter/material.dart';
import 'package:macros_to_helldivers/stratagems_page/models/tabs_menu_enum.dart';
import 'package:macros_to_helldivers/stratagems_page/state/stratagems_state.dart';

class TabsMenuProvider extends ChangeNotifier {
  StratagemsState state = StratagemsState.instance;

  bool isThisMenuSelected(TabsMenuEnum menu) {
    return state.tabMenuSelected == menu;
  }
}
