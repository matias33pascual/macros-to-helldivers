import 'package:flutter/material.dart';
import 'package:macro_sync_client/mission_page/screens/widgets/exports_widgets.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_model.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    Key? key,
    required this.stratagemsList,
  }) : super(key: key);

  final List<StratagemModel> stratagemsList;

  @override
  Widget build(BuildContext context) {
    final List<Widget> stratagemsWidgetsList = [];

    if (stratagemsList.isEmpty) {
      return Container();
    } else if (stratagemsList.length == 1) {
      return Center(child: StratagemButton(stratagem: stratagemsList[0]));
    } else {
      // if (stratagemsList.length < 7) {
      //   // TODO: terminar esta parte -> 03/05 | 01:33

      //   final widgetsInGrid = _buildGridFormLessThanSeven();
      //   stratagemsWidgetsList.addAll(widgetsInGrid);

      // TODO: hacer una funcion auxiliar aca -> 03/05 | 01:34

      for (var i = 0; i < stratagemsList.length; i++) {
        stratagemsWidgetsList.add(
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: StratagemButton(stratagem: stratagemsList[i]),
                ),
                if (i + 1 < stratagemsList.length)
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: StratagemButton(stratagem: stratagemsList[++i]),
                  ),
              ],
            ),
          ),
        );
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stratagemsWidgetsList,
    );
  }

  List<dynamic> _buildGridFormLessThanSeven() {
    final stratagemsWidgetsList = [];

    for (var i = 0; i < stratagemsList.length; i++) {
      stratagemsWidgetsList.add(
        Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: StratagemButton(stratagem: stratagemsList[i]),
            ),
            if (i + 1 < stratagemsList.length)
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: StratagemButton(stratagem: stratagemsList[++i]),
              ),
          ],
        ),
      );
    }

    return stratagemsWidgetsList;
  }
}
