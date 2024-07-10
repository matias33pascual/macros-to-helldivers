// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:macro_sync_helldivers/mission_page/screens/mission_page.dart';
import 'package:macro_sync_helldivers/shared/services/connection_service.dart';
import 'package:macro_sync_helldivers/shared/ui/exports_shared.dart';
import 'package:macro_sync_helldivers/stratagems_page/providers/stratagems_provider.dart';
import 'package:macro_sync_helldivers/stratagems_page/widgets/exports_widgets.dart';
import 'package:macro_sync_helldivers/theme/app_theme.dart';
import 'package:provider/provider.dart';

class StratagemsPage extends StatelessWidget {
  const StratagemsPage({Key? key}) : super(key: key);

  static String routeName = "stratagems_page";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ConnectionService.instance.disconnect();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          appBar: CustomAppBar(
            title: "Estratagemas",
            color: AppTheme.colors.darkRed,
            onBackButtonPressed: () => ConnectionService.instance.disconnect(),
          ),
          body: Stack(
            children: [
              _buildBackground(context),
              _buildPanel(context),
              _buildContent(context),
            ],
          ),
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
                      onTap: () {
                        final StratagemsProvider provider =
                            Provider.of<StratagemsProvider>(context,
                                listen: false);
                        provider.state.stratagemsSelectedForMission;

                        final message = {
                          "type": "prepare-stratagems",
                          "value": provider.state.stratagemsSelectedForMission
                        };

                        final jsonMessage = jsonEncode(message);

                        ConnectionService.instance
                            .sendMessage(message: jsonMessage);

                        Navigator.of(context).pushNamed(
                          MissionPage.routeName,
                        );
                      },
                      child: CustomButton(
                        color: CustomButtonColors.yellow,
                        text: "COMENZAR",
                        height: 40,
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
      "assets/images/stratagems_background.webp",
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
