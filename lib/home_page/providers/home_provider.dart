import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/providers/connect_button_provider.dart';
import 'package:macro_sync_client/home_page/states/home_state.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  HomeState state = HomeState.instance;

  void setIsLoading(bool value, BuildContext context) {
    print("loading: $value");

    state.isLoading = value;

    final ConnectButtonProvider connectButtonProvider =
        Provider.of<ConnectButtonProvider>(context, listen: false);

    connectButtonProvider.notifyListeners();

    notifyListeners();
  }

  void setIPAddress(String value, BuildContext context) {
    state.ipAddrress = value;

    final ConnectButtonProvider connectButtonProvider =
        Provider.of<ConnectButtonProvider>(context, listen: false);

    connectButtonProvider.notifyListeners();
  }

  void setPort(String value, BuildContext context) {
    state.port = value;

    final ConnectButtonProvider connectButtonProvider =
        Provider.of<ConnectButtonProvider>(context, listen: false);

    connectButtonProvider.notifyListeners();
  }

  void setMessageError(bool value) {
    state.error = value;
    notifyListeners();
  }
}
