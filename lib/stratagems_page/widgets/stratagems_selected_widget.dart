import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:provider/provider.dart';

class StratagemsSelectedWidget extends StatelessWidget {
  const StratagemsSelectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SelectedProvider provider = Provider.of<SelectedProvider>(context);

    return Wrap(
      children: provider.state.stratagemsSelectedForMission
          .map((e) => _StratagemIcon(stratagemId: e))
          .toList(),
    );
  }
}

class _StratagemIcon extends StatelessWidget {
  final String stratagemId;

  const _StratagemIcon({Key? key, required this.stratagemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider provider =
        Provider.of<StratagemsProvider>(context, listen: false);

    StratagemModel stratagem = provider.getStratagemById(stratagemId);

    return InkWell(
      onTap: () => provider.onSelectedIconTap(stratagemId, context),
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          border: Border.all(
            color: Colors.amber,
            width: 1,
          ),
        ),
        child: Image.asset(stratagem.icon),
      ),
    );
  }
}
