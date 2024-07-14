import 'package:flutter/material.dart';
import 'package:macros_to_helldivers/shared/ui/custom_button.dart';

class TestAppButton extends StatelessWidget {
  const TestAppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomButton(
      color: CustomButtonColors.yellow,
      text: "Iniciar sin conexion",
      height: 40,
      fontSize: 13,
    );
  }
}
