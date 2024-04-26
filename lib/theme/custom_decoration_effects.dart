import 'package:flutter/material.dart';
import 'package:macro_sync_client/theme/exports_theme.dart';

class CustomDecorationEffects {
  final _appColors = AppTheme.colors;
  final int _lines = 30;
  final int _lineDivision = 12;

  late final diagonalLinearGradientYellow = LinearGradient(
    colors: List.generate(
      _lines,
      (index) => index.isEven
          ? _appColors.buttonLigthYellowDiagonal
          : _appColors.buttonDarkYellowDiagonal,
    ),
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: List.generate(_lines, (index) => index / _lineDivision),
    tileMode: TileMode.repeated,
    transform: const GradientRotation(0.785),
  );

  late final diagonalLinearGradientGray = LinearGradient(
    colors: List.generate(
      _lines,
      (index) => index.isEven ? Colors.black : _appColors.borderGray,
    ),
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: List.generate(_lines, (index) => index / _lineDivision),
    tileMode: TileMode.repeated,
    transform: const GradientRotation(0.785),
  );
}
