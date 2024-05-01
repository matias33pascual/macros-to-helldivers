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

  onHorizontalGestureHandler(DragEndDetails details, BuildContext context) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
      _moveToPreviousTabMenu(context);
    } else if (details.velocity.pixelsPerSecond.dx < 0) {
      _moveToNextTabMenu(context);
    }
  }

  _moveToNextTabMenu(BuildContext context) {
    switch (state.tabMenuSelected) {
      case TabsMenuEnum.mission:
        onTabMenuHandler(TabsMenuEnum.defenses, context);
        break;
      case TabsMenuEnum.defenses:
        onTabMenuHandler(TabsMenuEnum.eagle, context);
        break;
      case TabsMenuEnum.eagle:
        onTabMenuHandler(TabsMenuEnum.orbital, context);
        break;
      case TabsMenuEnum.orbital:
        onTabMenuHandler(TabsMenuEnum.weapons, context);
        break;
      case TabsMenuEnum.weapons:
        onTabMenuHandler(TabsMenuEnum.backpacks, context);
        break;
      default:
        break;
    }
  }

  _moveToPreviousTabMenu(BuildContext context) {
    switch (state.tabMenuSelected) {
      case TabsMenuEnum.defenses:
        onTabMenuHandler(TabsMenuEnum.mission, context);
        break;
      case TabsMenuEnum.eagle:
        onTabMenuHandler(TabsMenuEnum.defenses, context);
        break;
      case TabsMenuEnum.orbital:
        onTabMenuHandler(TabsMenuEnum.eagle, context);
        break;
      case TabsMenuEnum.weapons:
        onTabMenuHandler(TabsMenuEnum.orbital, context);
        break;
      case TabsMenuEnum.backpacks:
        onTabMenuHandler(TabsMenuEnum.weapons, context);
        break;
      default:
        break;
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
