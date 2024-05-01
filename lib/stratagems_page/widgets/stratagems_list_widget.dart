import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:provider/provider.dart';

class StratagemsListWidget extends StatelessWidget {
  const StratagemsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider provider =
        Provider.of<StratagemsProvider>(context);

    final listToShow = provider.state.listToShow;

    return Flexible(
      flex: 4,
      child: GestureDetector(
        onHorizontalDragEnd: (details) =>
            provider.onHorizontalGestureHandler(details, context),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listToShow.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => provider.onStratagemsListTap(listToShow[index]),
            child: Container(
              height: 32,
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: provider.isSelected(listToShow[index])
                    ? Colors.green.withOpacity(0.6)
                    : const Color.fromARGB(137, 81, 95, 122),
                border: Border.all(
                  color: provider.isSelected(listToShow[index])
                      ? Colors.green
                      : Colors.white.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  const SkullIcon(width: 32),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: CustomText(
                      text: listToShow[index].name,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
