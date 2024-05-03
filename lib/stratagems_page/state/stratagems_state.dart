import 'package:macro_sync_client/stratagems_page/models/tabs_menu_enum.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';

class StratagemsState {
  StratagemsState._();

  static final StratagemsState _instance = StratagemsState._();

  static StratagemsState get instance => _instance;

  List<StratagemModel> defensesStratagemsList = [];
  List<StratagemModel> missionStratagemsList = [];
  List<StratagemModel> eagleStratagemsList = [];
  List<StratagemModel> orbitalStratagemsList = [];
  List<StratagemModel> backpacksStratagemsList = [];
  List<StratagemModel> weaponsStratagemsList = [];

  TabsMenuEnum tabMenuSelected = TabsMenuEnum.mission;
  List<StratagemModel> listToShow = [];
  List<String> stratagemsSelectedForMission = [
    "100",
    "101",
    "102",
  ];

  int maxStratagemSelected = 10;

  bool useGridLayout = true;
}
