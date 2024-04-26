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

    final colors = AppTheme.colors;

    return Scaffold(
      appBar: CustomAppBar(title: 'MACRO SYNC MOBILE'),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 210,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: const VerticalBar(
                          height: 210,
                          side: VerticalBarSide.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: colors.borderGray,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "INGRESA LOS DATOS DE MACRO SYNC DESKTOP",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
