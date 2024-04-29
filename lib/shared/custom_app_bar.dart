import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: color,
      title: CustomText(text: title, size: 24),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
