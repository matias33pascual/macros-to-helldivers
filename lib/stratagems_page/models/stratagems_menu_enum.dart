enum StratagemsMenuEnum { mision, defensas, aguila, orbital, armas, mochilas }

extension StratagemsMenuEnumExtension on StratagemsMenuEnum {
  String getStringValue() {
    switch (this) {
      case StratagemsMenuEnum.mision:
        return 'MISION';
      case StratagemsMenuEnum.defensas:
        return 'DEFENSAS';
      case StratagemsMenuEnum.aguila:
        return 'AGUILA';
      case StratagemsMenuEnum.orbital:
        return 'ORBITAL';
      case StratagemsMenuEnum.armas:
        return 'ARMAS';
      case StratagemsMenuEnum.mochilas:
        return 'MOCHILAS';
      default:
        return '';
    }
  }
}
