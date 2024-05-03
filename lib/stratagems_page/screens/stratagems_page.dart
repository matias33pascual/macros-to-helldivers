// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:macro_sync_client/mission_page/screens/mission_page.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/stratagems_page/providers/stratagems_provider.dart';
import 'package:macro_sync_client/stratagems_page/widgets/exports_widgets.dart';
import 'package:macro_sync_client/theme/app_theme.dart';
import 'package:provider/provider.dart';

class StratagemsPage extends StatelessWidget {
  const StratagemsPage({Key? key}) : super(key: key);

  static String routeName = "stratagems_page";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar:
            CustomAppBar(title: "Estratagemas", color: AppTheme.colors.darkRed),
        body: Stack(
          children: [
            _buildBackground(context),
            _buildPanel(context),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Container _buildContent(BuildContext context) {
    final StratagemsProvider provider = Provider.of<StratagemsProvider>(
      context,
      listen: false,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FutureBuilder(
        future: provider.loadStratagems(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container();
              }

              return Column(
                children: [
                  const TabMenuWidget(),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      child: const StratagemsListWidget(),
                    ),
                  ),
                  _buildHorizontalDivider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomText(
                      text: "SELECCIONADAS PARA MISION",
                      size: 16,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: StratagemsSelectedWidget(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        MissionPage.routeName,
                      ),
                      child: CustomButton(
                        color: CustomButtonColors.yellow,
                        text: "COMENZAR",
                      ),
                    ),
                  ),
                ],
              );
            case ConnectionState.waiting:
              return Stack(
                children: [
                  _buildBackground(context),
                  LinearProgressIndicator(
                    color:
                        const Color.fromARGB(255, 148, 0, 57).withOpacity(0.4),
                    backgroundColor: AppTheme.colors.darkRed,
                  ),
                ],
              );

            default:
              return Container();
          }
        },
      ),
    );
  }

  Container _buildHorizontalDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.amber, width: 1)),
      ),
    );
  }

  Container _buildPanel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.1),
    );
  }

  _buildBackground(BuildContext context) {
    return Image.asset(
      "assets/images/stratagems_background.jpg",
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
