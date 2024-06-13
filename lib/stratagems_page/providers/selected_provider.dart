import 'package:flutter/material.dart';
import 'package:macro_sync_helldivers/stratagems_page/state/stratagems_state.dart';

class SelectedProvider extends ChangeNotifier {
  StratagemsState state = StratagemsState.instance;

  update() {
    notifyListeners();
  }
}
