enum TabsMenuEnum { mission, defenses, eagle, orbital, weapons, backpacks }

extension TabMenuEnumExtension on TabsMenuEnum {
  String getStringValue() {
    switch (this) {
      case TabsMenuEnum.mission:
        return 'MISION';
      case TabsMenuEnum.defenses:
        return 'DEFENSAS';
      case TabsMenuEnum.eagle:
        return 'AGUILA';
      case TabsMenuEnum.orbital:
        return 'ORBITAL';
      case TabsMenuEnum.weapons:
        return 'ARMAS';
      case TabsMenuEnum.backpacks:
        return 'MOCHILAS';
      default:
        return '';
    }
  }
}
