import 'package:flutter/cupertino.dart';
import 'package:macros_to_helldivers/shared/translation/translation_provider.dart';
import 'package:provider/provider.dart';

enum TabsMenuEnum { mission, defenses, eagle, orbital, weapons, backpacks }

extension TabMenuEnumExtension on TabsMenuEnum {
  String getStringValue(BuildContext context) {
    final TranslationProvider provider =
        Provider.of<TranslationProvider>(context);

    switch (this) {
      case TabsMenuEnum.mission:
        return provider.translationOf["stratagems_mission"];
      case TabsMenuEnum.defenses:
        return provider.translationOf["stratagems_defenses"];
      case TabsMenuEnum.eagle:
        return provider.translationOf["stratagems_eagle"];
      case TabsMenuEnum.orbital:
        return provider.translationOf["stratagems_orbital"];
      case TabsMenuEnum.weapons:
        return provider.translationOf["stratagems_weapons"];
      case TabsMenuEnum.backpacks:
        return provider.translationOf["stratagems_backpacks"];
      default:
        return '';
    }
  }
}
