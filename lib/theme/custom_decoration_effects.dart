import 'package:flutter/material.dart';
import 'package:macros_to_helldivers/theme/exports_theme.dart';

class CustomDecorationEffects {
  final _appColors = AppTheme.colors;

  late final diagonalLinearGradientYellow = LinearGradient(
      colors: List.generate(
        30,
        (index) => index.isEven
            ? _appColors.buttonLigthYellowDiagonal
            : _appColors.buttonDarkYellowDiagonal,
      ),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: List.generate(30, (index) => index / 12),
      tileMode: TileMode.repeated,
      transform: const GradientRotation(0.785));

  late final diagonalLinearGradientGray = LinearGradient(
      colors: List.generate(
        30,
        (index) => index.isEven ? Colors.black : _appColors.borderGray,
      ),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: List.generate(30, (index) => index / 12),
      tileMode: TileMode.repeated,
      transform: const GradientRotation(0.785));

  late final verticalLinearGradientGrey = LinearGradient(
      colors: List.generate(
        100,
        (index) =>
            index.isEven ? Colors.transparent : AppTheme.colors.borderGray,
      ),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: List.generate(100, (index) => index / 80),
      tileMode: TileMode.repeated,
      transform: const GradientRotation(0.785));

  late final horizontalLinearGradientGrey = LinearGradient(
      colors: List.generate(
        3,
        (index) =>
            index.isEven ? Colors.transparent : AppTheme.colors.borderGray,
      ),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: List.generate(3, (index) => index / 3),
      tileMode: TileMode.repeated,
      transform: const GradientRotation(0.785));
}
