import 'package:macro_sync_client/stratagems_page/models/stratagems_menu_enum.dart';

class StratagemsState {
  StratagemsState._();

  static final StratagemsState _instance = StratagemsState._();

  static StratagemsState get instance => _instance;

  StratagemsMenuEnum menuSelected = StratagemsMenuEnum.defensas;
}
