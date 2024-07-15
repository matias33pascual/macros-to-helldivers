import 'package:flutter/material.dart';
import 'package:macros_to_helldivers/shared/translation/translation_service.dart';
import 'package:macros_to_helldivers/shared/translation/translation_state.dart';

class TranslationProvider extends ChangeNotifier {
  TranslationService service = TranslationService.instance;
  TranslationState state = TranslationState.instance;

  loadLanguageFile() async {
    state.translation = await service.loadLanguages(state.currentLanguage.code);
  }

  get translationOf {
    return state.translation;
  }

  setCurrentLanguage(LanguagesEnum language) {
    state.currentLanguage = language;
    notifyListeners();
  }
}
