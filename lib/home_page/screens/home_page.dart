// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/screens/widgets/exports_widgets.dart';
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
        body: Container(
          padding: EdgeInsets.only(top: 16, left: 8, right: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitle(),
                SizedBox(height: 100),
                Stack(
                  children: [
                    _buildForm(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildForm() {
    final colors = AppTheme.colors;

    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: Stack(
        children: [
          _buildPanel(),
          _buildVerticalBar(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 8, top: 6),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colors.borderGray,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "INGRESA LOS DATOS DE MACRO SYNC DESKTOP",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppTheme.font,
                            fontSize: 11,
                          ),
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            "assets/images/skull_icon.png",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const CustomForm(),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ConnectButton(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildVerticalBar() {
    return Positioned(
      top: 2,
      left: 2,
      child: const VerticalBar(
        height: 148,
        side: VerticalBarSide.left,
      ),
    );
  }

  Container _buildPanel() {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }

  _buildTitle() {
    return Image.asset("assets/images/helldivers_title.png", width: 260);
  }
}
