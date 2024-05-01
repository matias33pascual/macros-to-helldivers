import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';

class StratagemsService {
  StratagemsService._();

  static final StratagemsService _instance = StratagemsService._();

  static StratagemsService get instance => _instance;

  Future<List<StratagemModel>> loadStratagemsFromFile(String file) async {
    final List<StratagemModel> stratagemsList = [];

    String jsonString = await rootBundle.loadString('assets/json/$file.json');

    final data = json.decode(jsonString);

    for (final stratagem in data) {
      stratagemsList.add(StratagemModel.fromMap(stratagem));
    }
    return stratagemsList;
  }
}
