import 'package:flutter/material.dart';

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
    return Container(
      width: width,
      height: 10,
      decoration: BoxDecoration(
        border: Border(
          left: const BorderSide(color: Colors.amber, width: 1),
          right: const BorderSide(color: Colors.amber, width: 1),
          top: side == HorizontalBarSide.top
              ? const BorderSide(color: Colors.amber, width: 1)
              : BorderSide.none,
          bottom: side == HorizontalBarSide.bottom
              ? const BorderSide(color: Colors.amber, width: 1)
              : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: List.generate(
                  2,
                  (index) => index.isEven ? Colors.amber : Colors.black,
                ),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: List.generate(2, (index) => index / 1),
                tileMode: TileMode.repeated,
                transform: const GradientRotation(0.785)),
          ),
        ),
      ),
    );
  }
}
