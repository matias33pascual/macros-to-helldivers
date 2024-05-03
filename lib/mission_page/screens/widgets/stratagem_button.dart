import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';

class StratagemButton extends StatelessWidget {
  const StratagemButton({
    Key? key,
    required this.stratagem,
    this.verticalPadding = 24,
  }) : super(key: key);

  final StratagemModel stratagem;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(stratagem.icon)],
      ),
    );
  }
}
