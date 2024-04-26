import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/screens/widgets/exports_widgets.dart';
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

    final decorationEffects = AppTheme.decorationEffects;
    final colors = AppTheme.colors;

    return Scaffold(
      body: Container(
        color: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 210,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 8,
                      height: 210,
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          color: colors.borderGray,
                          width: 1,
                        ),
                        top: BorderSide(
                          color: colors.borderGray,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: colors.borderGray,
                          width: 1,
                        ),
                      )),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 2, top: 2, bottom: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient:
                                decorationEffects.verticalLinearGradientGrey,
                          ),
                        ),
                      ),
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
                            ))),
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
          ),
        ),
      ),
    );
  }
}
