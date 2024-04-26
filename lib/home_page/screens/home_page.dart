import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/screens/widgets/exports_widgets.dart';

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

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("INGRESA LOS DATOS DE"),
                Text("MACRO SYNC DESKTOP"),
                SizedBox(height: 10),
                CustomForm(),
                SizedBox(height: 10),
                ConnectButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
