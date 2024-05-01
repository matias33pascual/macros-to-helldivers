import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/models/tabs_menu_enum.dart';
import 'package:macro_sync_client/stratagems_page/state/stratagems_state.dart';

class TabsMenuProvider extends ChangeNotifier {
  StratagemsState state = StratagemsState.instance;

  bool isThisMenuSelected(TabsMenuEnum menu) {
    return state.tabMenuSelected == menu;
  }
}
