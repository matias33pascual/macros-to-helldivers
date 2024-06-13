import 'package:flutter/material.dart';
import 'package:macro_sync_helldivers/mission_page/states/mission_state.dart';

class MissionProvider extends ChangeNotifier {
  MissionState state = MissionState.instance;

  String getIconPath() {
    final String iconPath =
        state.useGridLayout ? state.gridIconPath : state.listIconPath;

    return iconPath;
  }

  void setNewLayout() {
    state.useGridLayout = !state.useGridLayout;
    notifyListeners();
  }
}
