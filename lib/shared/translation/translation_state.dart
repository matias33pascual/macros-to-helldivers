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

  LanguagesEnum currentLanguage = LanguagesEnum.english;

  Map<String, dynamic>? translation;
}
