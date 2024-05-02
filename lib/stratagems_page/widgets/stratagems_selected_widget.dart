import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:provider/provider.dart';

class StratagemsSelectedWidget extends StatelessWidget {
  const StratagemsSelectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SelectedProvider provider = Provider.of<SelectedProvider>(context);

    final list = provider.state.stratagemsSelectedForMission
        .map((e) => _StratagemIcon(stratagemId: e))
        .toList();

    if (list.length < provider.state.maxStratagemSelected) {
      for (var i = list.length; i < provider.state.maxStratagemSelected; i++) {
        list.add(const _StratagemIcon());
      }
    }

    return Wrap(children: list);
  }
}

class _StratagemIcon extends StatelessWidget {
  final String? stratagemId;

  const _StratagemIcon({Key? key, this.stratagemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider provider =
        Provider.of<StratagemsProvider>(context, listen: false);

    if (stratagemId != null) {
      StratagemModel stratagem = provider.getStratagemById(stratagemId!);

      return InkWell(
        onTap: () => provider.onSelectedIconTap(stratagemId!, context),
        child: _StratagemFrameIcon(stratagem: stratagem),
      );
    } else {
      return const _StratagemFrameIcon();
    }
  }
}

class _StratagemFrameIcon extends StatelessWidget {
  const _StratagemFrameIcon({
    Key? key,
    this.stratagem,
  }) : super(key: key);

  final StratagemModel? stratagem;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: stratagem != null ? Image.asset(stratagem!.icon) : null,
    );
  }
}
