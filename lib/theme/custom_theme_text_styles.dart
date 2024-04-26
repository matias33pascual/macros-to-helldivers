import 'package:flutter/material.dart';
import 'package:macro_sync_client/theme/exports_theme.dart';

class CustomThemeTextStyles {
  final _appColors = AppTheme.colors;

  TextStyle menu = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  late TextStyle hintTextNotSelected = TextStyle(
    color: _appColors.borderGray,
    fontWeight: FontWeight.w600,
  );

  late TextStyle hintTextSelected = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );
}
