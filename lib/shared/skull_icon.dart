import 'package:flutter/material.dart';

class SkullIcon extends StatelessWidget {
  final double width;

  const SkullIcon({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/skull_icon.png', width: width);
  }
}
