class HomeState {
  HomeState._();
  static final HomeState _instance = HomeState._();
  static HomeState get instance => _instance;

  String ipAddrress = "";
  String port = "";

  bool error = false;
}
