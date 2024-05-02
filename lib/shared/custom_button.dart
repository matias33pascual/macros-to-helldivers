import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/custom_text.dart';
import 'package:macro_sync_client/theme/app_theme.dart';

enum CustomButtonColors {
  gray,
  yellow,
  green,
}

class CustomButton extends StatelessWidget {
  final CustomButtonColors color;
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
          width: color == CustomButtonColors.gray ? 2 : 1,
          color: color == CustomButtonColors.yellow
              ? Colors.amber
              : appColors.borderGray,
        ),
        borderRadius: BorderRadius.zero,
        gradient: color == CustomButtonColors.yellow
            ? appDecorationEffects.diagonalLinearGradientYellow
            : appDecorationEffects.diagonalLinearGradientGray,
      ),
      width: 140,
      height: 30,
      child: Center(
        child: CustomText(
          text: text,
          size: 18,
          textColor:
              color == CustomButtonColors.yellow ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }
}
