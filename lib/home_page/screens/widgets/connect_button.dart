import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/providers/exports_providers.dart';
import 'package:macro_sync_client/shared/custom_button/custom_button.dart';
import 'package:macro_sync_client/shared/custom_button/custom_button_colors_enum.dart';
import 'package:provider/provider.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConnectButtonProvider provider =
        Provider.of<ConnectButtonProvider>(context);

    return CustomButton(
      color: provider.state.isFormValid
          ? CustomButtonColorsEnum.yellow
          : CustomButtonColorsEnum.gray,
      text: "CONECTAR",
    );
  }
}
