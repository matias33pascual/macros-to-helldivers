import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/custom_text.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';

class StratagemListButton extends StatelessWidget {
  const StratagemListButton({
    Key? key,
    required this.stratagem,
    this.maxLines = 2,
    this.textSize = 17,
    this.iconSize = 80,
    this.horizontalPadding = 2,
  }) : super(key: key);

  final StratagemModel stratagem;
  final int maxLines;
  final double textSize;
  final double iconSize;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPadding),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        border: Border.all(
          color: Colors.blue.withOpacity(0.7),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Image.asset(
              stratagem.icon,
              height: iconSize,
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: CustomText(
              text: stratagem.name,
              size: textSize,
              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }
}
