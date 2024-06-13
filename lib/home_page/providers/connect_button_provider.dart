import 'package:flutter/material.dart';
import 'package:macro_sync_helldivers/home_page/states/home_state.dart';

class ConnectButtonProvider extends ChangeNotifier {
  HomeState state = HomeState.instance;

  bool get isFormValid =>
      state.ipAddrress.isNotEmpty && state.port.isNotEmpty && !state.isLoading;
}
