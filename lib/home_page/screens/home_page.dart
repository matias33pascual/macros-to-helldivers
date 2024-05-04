import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/screens/widgets/exports_widgets.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/stratagems_page/screens/stratagems_page.dart';
import 'package:macro_sync_client/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = "home_page";

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
            _buildBackground(context),
            _buildMacroSyncTitle(),
            _buildHelldiversTitle(),
            _buildForm(context),
          ],
        ),
      ),
    );
  }

  Padding _buildHelldiversTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/helldivers_title.png",
                width: 260,
                color: Colors.amber[400],
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildMacroSyncTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "Macro Sync Mobile",
            size: 20,
            textColor: Colors.amber[400]!,
            strokeColor: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Image _buildBackground(BuildContext context) {
    return Image.asset(
      "assets/images/home_background.png",
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }

  _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              _buildPanel(),
              _buildContent(context),
            ],
          ),
        ],
      ),
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          _buildDivisor(),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: const CustomForm(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, StratagemsPage.routeName),
              child: const ConnectButton(),
            ),
          )
        ],
      ),
    );
  }

  Container _buildDivisor() {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.amber[500]!.withOpacity(0.6),
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: "INGRESA LOS DATOS DE MACRO SYNC DESKTOP",
              size: 18,
              maxLines: 2,
              textColor: Colors.white,
              strokeColor: Colors.black.withOpacity(0.7),
              centerText: true,
            ),
          ),
        ],
      ),
    );
  }

  _buildPanel() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        border: Border.all(
          color: Colors.amber[500]!.withOpacity(0.6),
          width: 2,
          strokeAlign: StrokeAlign.inside,
        ),
      ),
    );
  }
}
