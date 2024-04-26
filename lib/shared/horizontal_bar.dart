import 'package:flutter/material.dart';
import 'package:macro_sync_client/theme/exports_theme.dart';

enum HorizontalBarSide { top, bottom }

class HorizontalBar extends StatelessWidget {
  final double width;
  final HorizontalBarSide side;

  const HorizontalBar({
    Key? key,
    required this.width,
    required this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decorationEffects = AppTheme.decorationEffects;
    final colors = AppTheme.colors;

    return Container(
      width: width,
      height: 10,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: colors.borderGray, width: 1),
          right: BorderSide(color: colors.borderGray, width: 1),
          top: side == HorizontalBarSide.top
              ? BorderSide(color: colors.borderGray, width: 1)
              : BorderSide.none,
          bottom: side == HorizontalBarSide.bottom
              ? BorderSide(color: colors.borderGray, width: 1)
              : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 2, top: 2, bottom: 2),
        child: Container(
          decoration: BoxDecoration(
            gradient: decorationEffects.horizontalLinearGradientGrey,
          ),
        ),
      ),
    );
  }
}
