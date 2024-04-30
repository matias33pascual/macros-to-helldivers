import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_menu_enum.dart';
import 'package:macro_sync_client/stratagems_page/state/stratagems_state.dart';

class TabMenuProvider extends ChangeNotifier {
  StratagemsState state = StratagemsState.instance;

  bool isThisMenuSelected(StratagemsMenuEnum menu) {
    return state.menuSelected == menu;
  }

  setTabMenuSelected(StratagemsMenuEnum menu) {
    state.menuSelected = menu;
    notifyListeners();
  }
}
