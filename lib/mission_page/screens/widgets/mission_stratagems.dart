import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:provider/provider.dart';

class MissionStratagems extends StatelessWidget {
  const MissionStratagems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider provider =
        Provider.of<StratagemsProvider>(context, listen: false);

    final List<StratagemModel> stratagemsList = provider
        .state.stratagemsSelectedForMission
        .map((stratagemId) => provider.getStratagemById(stratagemId))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(children: [
            _StratagemButton(stratagem: stratagemsList[0]),
            _StratagemButton(stratagem: stratagemsList[1]),
          ]),
        ),
        Expanded(
          child: Row(children: [
            _StratagemButton(stratagem: stratagemsList[2]),
            _StratagemButton(stratagem: stratagemsList[3]),
          ]),
        ),
        Expanded(
          child: Row(children: [
            _StratagemButton(stratagem: stratagemsList[4]),
            _StratagemButton(stratagem: stratagemsList[5]),
          ]),
        ),
        Expanded(
          child: Row(children: [
            _StratagemButton(stratagem: stratagemsList[6]),
            _StratagemButton(stratagem: stratagemsList[7]),
          ]),
        ),
        Expanded(
          child: Row(children: [
            _StratagemButton(stratagem: stratagemsList[8]),
            _StratagemButton(stratagem: stratagemsList[9]),
          ]),
        ),
      ],
    );
  }
}

class _StratagemButton extends StatelessWidget {
  const _StratagemButton({
    Key? key,
    required this.stratagem,
  }) : super(key: key);

  final StratagemModel stratagem;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
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
      ),
    );
  }
}
