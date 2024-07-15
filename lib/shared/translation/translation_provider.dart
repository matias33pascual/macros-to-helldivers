import 'package:flutter/material.dart';
import 'package:macros_to_helldivers/shared/translation/translation_service.dart';
import 'package:macros_to_helldivers/shared/translation/translation_state.dart';

class TranslationProvider extends ChangeNotifier {
  TranslationService service = TranslationService.instance;
  TranslationState state = TranslationState.instance;

  loadLanguageFile() async {
    state.spanishTranslation =
        await service.loadLanguages(LanguagesEnum.spanish.code);
    state.portugueseTranslation =
        await service.loadLanguages(LanguagesEnum.portuguese.code);
    state.englishTranslation =
        await service.loadLanguages(LanguagesEnum.english.code);
  }

  get translationOf {
    return state.translation;
  }

  setCurrentLanguage(LanguagesEnum language) {
    state.currentLanguage = language;
    notifyListeners();
  }

  get flagIcon {
    switch (state.currentLanguage) {
      case LanguagesEnum.portuguese:
        return Image.asset("assets/images/flag-brasil.webp");

      case LanguagesEnum.english:
        return Image.asset("assets/images/flag-usa.webp");

      case LanguagesEnum.spanish:
      default:
        return Image.asset("assets/images/flag-argentina.webp");
    }
  }
}
