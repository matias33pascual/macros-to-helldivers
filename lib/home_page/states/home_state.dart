class HomeState {
  HomeState._();
  static final HomeState _instance = HomeState._();
  static HomeState get instance => _instance;

  bool isFormValid = true;
}
