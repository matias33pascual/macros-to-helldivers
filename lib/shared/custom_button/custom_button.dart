import 'package:flutter/material.dart';
import 'package:macro_sync_client/theme/app_theme.dart';
import 'package:macro_sync_client/shared/custom_button/custom_button_colors_enum.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonColorsEnum color;
  final String text;

  const CustomButton({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppTheme.colors;
    final appDecorationEffects = AppTheme.decorationEffects;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: color == CustomButtonColorsEnum.gray ? 2 : 1,
          color: color == CustomButtonColorsEnum.yellow
              ? appColors.textYellow
              : appColors.borderGray,
        ),
        borderRadius: BorderRadius.zero,
        gradient: color == CustomButtonColorsEnum.yellow
            ? appDecorationEffects.diagonalLinearGradientYellow
            : appDecorationEffects.diagonalLinearGradientGray,
      ),
      width: 190,
      height: 35,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: color == CustomButtonColorsEnum.yellow
                ? appColors.borderYellow
                : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
