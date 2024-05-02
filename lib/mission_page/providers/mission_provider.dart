import 'package:flutter/material.dart';
import 'package:macro_sync_client/mission_page/states/mission_state.dart';

class MissionProvider extends ChangeNotifier {
  MissionState state = MissionState.instance;
}
