enum StratagemsMenuEnum {
  mission,
  defenses,
  eagle,
  orbital,
  weapons,
  backpacks
}

extension StratagemsMenuEnumExtension on StratagemsMenuEnum {
  String getStringValue() {
    switch (this) {
      case StratagemsMenuEnum.mission:
        return 'MISION';
      case StratagemsMenuEnum.defenses:
        return 'DEFENSAS';
      case StratagemsMenuEnum.eagle:
        return 'AGUILA';
      case StratagemsMenuEnum.orbital:
        return 'ORBITAL';
      case StratagemsMenuEnum.weapons:
        return 'ARMAS';
      case StratagemsMenuEnum.backpacks:
        return 'MOCHILAS';
      default:
        return '';
    }
  }
}
