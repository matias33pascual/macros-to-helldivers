enum LanguagesEnum { spanish, english, portuguese }

extension LanguagesEnumExtension on LanguagesEnum {
  String get code {
    switch (this) {
      case LanguagesEnum.english:
        return 'en';

      case LanguagesEnum.portuguese:
        return 'pt';

      case LanguagesEnum.spanish:
      default:
        return 'es';
    }
  }
}

class TranslationState {
  TranslationState._();

  static final TranslationState _instance = TranslationState._();

  static TranslationState get instance => _instance;

  LanguagesEnum currentLanguage = LanguagesEnum.spanish;

  Map<String, dynamic>? spanishTranslation;
  Map<String, dynamic>? englishTranslation;
  Map<String, dynamic>? portugueseTranslation;

  Map<String, dynamic>? strtagemsNamesInSpanish;
  Map<String, dynamic>? strtagemsNamesInEnglish;
  Map<String, dynamic>? strtagemsNamesInPortuguese;

  Map<String, dynamic>? get translation {
    switch (currentLanguage) {
      case LanguagesEnum.spanish:
        return spanishTranslation;

      case LanguagesEnum.portuguese:
        return portugueseTranslation;

      case LanguagesEnum.english:
      default:
        return englishTranslation;
    }
  }
}
