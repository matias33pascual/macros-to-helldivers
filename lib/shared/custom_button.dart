import 'package:flutter/material.dart';
import 'package:macro_sync_client/app/app_theme.dart';
import 'package:macro_sync_client/app/exports_providers.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppTheme.colors;

    final ConnectButtonProvider provider =
        Provider.of<ConnectButtonProvider>(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: provider.state.isFormValid
              ? appColors.secondary
              : appColors.background,
        ),
        borderRadius: BorderRadius.zero,
        gradient: LinearGradient(
          colors: List.generate(
            100,
            (index) => index.isEven
                ? provider.state.isFormValid
                    ? const Color.fromARGB(255, 45, 59, 43)
                    : appColors.primary.withAlpha(1)
                : const Color.fromARGB(255, 0, 0, 0),
          ),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: List.generate(100, (index) => index / 24),
          tileMode: TileMode.repeated, // Repite el patrón
          transform:
              const GradientRotation(45 * 3.14 / 180), // Rotación de 45 grados
        ),
      ),
      width: 190,
      height: 35,
      child: Center(
        child: Text(
          "CONECTAR",
          style: TextStyle(
            color: provider.state.isFormValid
                ? appColors.secondary
                : appColors.background,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
