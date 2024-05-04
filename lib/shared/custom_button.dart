import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/custom_text.dart';

enum CustomButtonColors {
  gray,
  yellow,
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
    return Container(
      decoration: BoxDecoration(
        color: color == CustomButtonColors.gray
            ? Colors.grey.withOpacity(0.1)
            : Colors.amber.withOpacity(0.1),
        border: Border.all(
          width: 2,
          color: color == CustomButtonColors.yellow
              ? Colors.amber.withOpacity(0.6)
              : Colors.grey.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.zero,
      ),
      width: 140,
      height: 30,
      child: Center(
        child: CustomText(
          text: text,
          size: 16,
          textColor: color == CustomButtonColors.yellow
              ? Colors.yellow[400]!.withOpacity(0.9)
              : Colors.grey.withOpacity(0.6),
        ),
      ),
    );
  }
}
