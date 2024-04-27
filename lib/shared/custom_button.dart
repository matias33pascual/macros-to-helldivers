import 'package:flutter/material.dart';
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
              ? appColors.textYellow
              : appColors.borderGray,
        ),
        borderRadius: BorderRadius.zero,
        gradient: color == CustomButtonColors.yellow
            ? appDecorationEffects.diagonalLinearGradientYellow
            : appDecorationEffects.diagonalLinearGradientGray,
      ),
      width: 190,
      height: 35,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: color == CustomButtonColors.yellow
                  ? appColors.borderYellow
                  : Colors.white,
              fontFamily: AppTheme.font),
        ),
      ),
    );
  }
}
