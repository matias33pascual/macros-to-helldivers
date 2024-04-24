import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/states/home_state.dart';

class HomeProvider extends ChangeNotifier {
  HomeState state = HomeState.instance;
}
