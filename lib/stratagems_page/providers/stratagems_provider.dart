import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';
import 'package:macro_sync_client/stratagems_page/models/tabs_menu_enum.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:macro_sync_client/stratagems_page/services/stratagems_service.dart';
import 'package:macro_sync_client/stratagems_page/state/stratagems_state.dart';
import 'package:provider/provider.dart';

class StratagemsProvider extends ChangeNotifier {
  StratagemsService service = StratagemsService.instance;
  StratagemsState state = StratagemsState.instance;

  Future loadStratagems() async {
    try {
      state.defensesStratagemsList =
          await service.loadStratagemsFromFile("defensive");

      state.missionStratagemsList =
          await service.loadStratagemsFromFile("mission");

      state.eagleStratagemsList = await service.loadStratagemsFromFile("eagle");

      state.orbitalStratagemsList =
          await service.loadStratagemsFromFile("orbital");

      state.backpacksStratagemsList =
          await service.loadStratagemsFromFile("backpacks");

      state.weaponsStratagemsList =
          await service.loadStratagemsFromFile("weapons");

      state.othersStratagemsList =
          await service.loadStratagemsFromFile("others");

      state.tabMenuSelected = TabsMenuEnum.mission;
      state.listToShow = state.missionStratagemsList;
    } catch (error) {
      if (kDebugMode) {
        print("Error al cargar las estratagemas en loadStratagems: $error");
      }
      rethrow;
    }
  }

  onTabMenuHandler(TabsMenuEnum tabMenuSelected, BuildContext context) {
    final TabsMenuProvider tabMenuProvider =
        Provider.of<TabsMenuProvider>(context, listen: false);

    state.tabMenuSelected = tabMenuSelected;
    state.listToShow = _getListToShowByTabMenu();

    tabMenuProvider.notifyListeners();
    notifyListeners();
  }

  isSelected(StratagemModel stratagem) {
    return state.stratagemsSelectedForMission.any(
        (String stratagemSelectedId) => stratagem.id == stratagemSelectedId);
  }

  onStratagemsListTap(StratagemModel stratagem) {
    if (isSelected(stratagem)) {
      state.stratagemsSelectedForMission.remove(stratagem.id);
    } else {
      state.stratagemsSelectedForMission.add(stratagem.id);
    }

    notifyListeners();
  }

  _getListToShowByTabMenu() {
    switch (state.tabMenuSelected) {
      case TabsMenuEnum.backpacks:
        return state.backpacksStratagemsList;

      case TabsMenuEnum.defenses:
        return state.defensesStratagemsList;

      case TabsMenuEnum.eagle:
        return state.eagleStratagemsList;

      case TabsMenuEnum.orbital:
        return state.orbitalStratagemsList;

      case TabsMenuEnum.weapons:
        return state.weaponsStratagemsList;

      case TabsMenuEnum.mission:
      default:
        return state.missionStratagemsList;
    }
  }
}
