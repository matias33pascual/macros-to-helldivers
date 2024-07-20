import 'package:flutter/material.dart';
import 'package:macros_to_helldivers/shared/translation/translation_service.dart';
import 'package:macros_to_helldivers/shared/translation/translation_state.dart';

class TranslationProvider extends ChangeNotifier {
  TranslationService service = TranslationService.instance;
  TranslationState state = TranslationState.instance;

  loadLanguageFiles() async {
    state.spanishTranslation =
        await service.loadLanguages(LanguagesEnum.spanish.code);

    state.portugueseTranslation =
        await service.loadLanguages(LanguagesEnum.portuguese.code);

    state.englishTranslation =
        await service.loadLanguages(LanguagesEnum.english.code);

    state.strtagemsNamesInSpanish =
        await service.loadStratagemsNameByLanguage(LanguagesEnum.spanish);

    state.strtagemsNamesInEnglish =
        await service.loadStratagemsNameByLanguage(LanguagesEnum.english);

    state.strtagemsNamesInPortuguese =
        await service.loadStratagemsNameByLanguage(LanguagesEnum.portuguese);
  }

  get translationTextOf {
    return state.translation;
  }

  getTranslationOfStratagemName(String stratagemId) {
    switch (state.currentLanguage) {
      case LanguagesEnum.spanish:
        return state.strtagemsNamesInSpanish?[stratagemId] ?? "";

      case LanguagesEnum.english:
        return state.strtagemsNamesInEnglish?[stratagemId] ?? "";

      case LanguagesEnum.portuguese:
        return state.strtagemsNamesInPortuguese?[stratagemId] ?? "";

      default:
        return "";
    }
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
