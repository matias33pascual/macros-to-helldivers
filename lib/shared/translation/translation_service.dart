import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class TranslationService {
  TranslationService._();

  static final TranslationService _instance = TranslationService._();

  static TranslationService get instance => _instance;

  loadLanguages(String currentLanguage) async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/languages/$currentLanguage.json');

      final translations = await json.decode(jsonString);

      return translations;
    } catch (error) {
      if (kDebugMode) {
        print("Error en TranslationService: $error");
      }
    }
  }
}
