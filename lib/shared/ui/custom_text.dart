import 'package:flutter/material.dart';
import 'package:macro_sync_client/theme/app_theme.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color strokeColor;
  final Color textColor;
  final bool useStroke;
  final int maxLines;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.size = 12,
    this.strokeColor = Colors.black,
    this.textColor = Colors.white,
    this.useStroke = true,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: AppTheme.font,
            fontSize: size,
            color: textColor,
          ),
        ),
        if (useStroke)
          Text(
            text,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: textAlign,
            style: TextStyle(
              fontFamily: AppTheme.font,
              fontSize: size,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = strokeColor,
            ),
          ),
      ],
    );
  }
}
