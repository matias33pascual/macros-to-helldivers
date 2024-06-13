import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:macro_sync_helldivers/shared/services/connection_service.dart';
import 'package:macro_sync_helldivers/stratagems_page/models/stratagems_model.dart';

class StratagemGridButton extends StatefulWidget {
  const StratagemGridButton({
    Key? key,
    required this.stratagem,
  }) : super(key: key);

  final StratagemModel stratagem;

  @override
  State<StratagemGridButton> createState() => _StratagemGridButtonState();
}

class _StratagemGridButtonState extends State<StratagemGridButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() {
        isPressed = true;

        final message = {
          "type": "use-stratagem",
          "value": widget.stratagem.id,
        };

        final jsonMessage = jsonEncode(message);

        ConnectionService.instance.sendMessage(message: jsonMessage);
      }),
      onTapUp: (details) => setState(() {
        isPressed = false;
      }),
      onTapCancel: () => setState(() {
        isPressed = false;
      }),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isPressed
              ? Colors.blue.withOpacity(0.5)
              : Colors.blue[800]!.withOpacity(0.4),
          border: Border.all(
            color: isPressed ? Colors.blue[400]! : Colors.blue.withOpacity(0.7),
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Transform.scale(
                scale: isPressed ? 0.98 : 1,
                child: Image.asset(
                  widget.stratagem.icon,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
