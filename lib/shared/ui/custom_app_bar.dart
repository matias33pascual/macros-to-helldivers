import 'package:flutter/material.dart';
import 'package:macro_sync_helldivers/shared/ui/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final Widget? actionButton;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.color = Colors.black,
    this.actionButton,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: color,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (onBackButtonPressed != null) {
            onBackButtonPressed!();
          }

          Navigator.pop(context);
        },
      ),
      title: CustomText(text: title, size: 24),
      actions: actionButton != null ? [actionButton!] : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
