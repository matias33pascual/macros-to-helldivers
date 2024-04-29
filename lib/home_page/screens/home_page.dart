// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/screens/widgets/exports_widgets.dart';
import 'package:macro_sync_client/shared/custom_text.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // IOWebSocketChannel? channel;

    // void onPressHandler() {
    //   debugPrint("Conectando al servidor . . .");
    //   IOWebSocketChannel.connect("ws://192.168.100.16:433");
    //   channel.sink.add("HOLA DESDE FLUTTER!!");
    // }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/home_background.png",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildTitle()],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_buildForm(context)],
            )
          ],
        ),
      ),
    );
  }

  _buildForm(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        constraints: BoxConstraints(maxWidth: 600),
        child: Stack(
          children: [
            _buildPanel(),
            _buildVerticalBar(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 16, top: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.colors.borderGray,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomText(
                  text: "INGRESA LOS DATOS DE MACRO SYNC DESKTOP",
                  size: 12,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 12), child: const CustomForm()),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, "stratagems"),
              child: ConnectButton(),
            ),
          )
        ],
      ),
    );
  }

  Positioned _buildVerticalBar() {
    return Positioned(
      top: 10,
      left: 8,
      child: const VerticalBar(height: 148, side: VerticalBarSide.left),
    );
  }

  Container _buildPanel() {
    return Container(
      height: 210,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
    );
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Image.asset("assets/images/helldivers_title.png", width: 260),
    );
  }
}
