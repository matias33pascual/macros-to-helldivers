import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_menu_enum.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:macro_sync_client/stratagems_page/services/stratagems_service.dart';
import 'package:macro_sync_client/stratagems_page/state/stratagems_state.dart';
import 'package:provider/provider.dart';

class StratagemsProvider extends ChangeNotifier {
  StratagemsService service = StratagemsService.instance;
  StratagemsState state = StratagemsState.instance;

  Future loadStratagems() async {
    try {
      state.defensiveStratagemsList =
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
    } catch (error) {
      if (kDebugMode) {
        print("Error al cargar las estratagemas en loadStratagems: $error");
      }
      rethrow;
    }
  }

  selectStratagemsList(StratagemsMenuEnum menuItem, BuildContext context) {
    final TabsMenuProvider tabMenuProvider =
        Provider.of<TabsMenuProvider>(context, listen: false);
    state.menuSelected = menuItem;
    tabMenuProvider.notifyListeners();
  }
}
