// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:provider/provider.dart';

class MissionStratagems extends StatelessWidget {
  const MissionStratagems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider stratagemsProvider =
        Provider.of<StratagemsProvider>(context, listen: false);

    final List<_StratagemButtonIcon> stratagemsList = stratagemsProvider
        .state.stratagemsSelectedForMission
        .map((stratagemId) => _StratagemButtonIcon(stratagemId: stratagemId))
        .toList();

    return Column(
      children: stratagemsList,
    );
  }
}

class _StratagemButtonIcon extends StatelessWidget {
  const _StratagemButtonIcon({Key? key, required this.stratagemId})
      : super(key: key);

  final String stratagemId;

  @override
  Widget build(BuildContext context) {
    const double size = 60;

    final StratagemsProvider stratagemsProvider =
        Provider.of<StratagemsProvider>(context, listen: false);

    StratagemModel stratagem = stratagemsProvider.getStratagemById(stratagemId);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      width: 180,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: 1),
          color: Colors.black.withOpacity(0.7),
        ),
        child: Image.asset(stratagem.icon),
      ),
    );
  }
}
