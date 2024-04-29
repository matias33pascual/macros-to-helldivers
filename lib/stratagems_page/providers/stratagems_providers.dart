import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/services/stratagems_service.dart';

class StratagemsProvider extends ChangeNotifier {
  StratagemsService service = StratagemsService.instance;

  Future loadStratagems() async {
    return await service.loadStratagemsFromFile();
  }
}
