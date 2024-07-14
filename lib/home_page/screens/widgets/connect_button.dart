import 'package:flutter/material.dart';
import 'package:macros_to_helldivers/home_page/providers/exports_providers.dart';
import 'package:macros_to_helldivers/shared/ui/exports_shared.dart';
import 'package:provider/provider.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConnectButtonProvider provider =
        Provider.of<ConnectButtonProvider>(context);

    return CustomButton(
      color: provider.isFormValid
          ? CustomButtonColors.yellow
          : CustomButtonColors.gray,
      text: "CONECTAR",
      height: 40,
    );
  }
}
