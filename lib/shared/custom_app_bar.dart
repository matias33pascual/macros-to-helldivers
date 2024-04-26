// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/shared/horizontal_bar.dart';
import 'package:macro_sync_client/theme/exports_theme.dart';

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
      leading: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SkullIcon(width: 10),
      ),
      title: Text(title),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: SizedBox(
          height: 20,
          child: Stack(
            children: [
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
