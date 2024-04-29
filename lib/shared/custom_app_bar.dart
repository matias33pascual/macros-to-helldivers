import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/shared/horizontal_bar.dart';
import 'package:macro_sync_client/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: const Padding(
        padding: EdgeInsets.all(2.0),
        child: SkullIcon(width: 10),
      ),
      title: Stack(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AppTheme.font,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: AppTheme.font,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Color.fromARGB(255, 36, 36, 36),
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: SizedBox(
          height: 20,
          child: Stack(
            children: const [
              Positioned(
                top: 4,
                left: 64,
                child:
                    HorizontalBar(width: 310, side: HorizontalBarSide.bottom),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
