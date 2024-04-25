// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:provider/provider.dart';
import 'package:macro_sync_client/home_page/providers/home_provider.dart';

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
        color: Colors.black87,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("INGRESA LOS DATOS DE"),
            Text("MACRO SYNC DESKTOP"),
            SizedBox(height: 10),
            CustomForm(),
            SizedBox(height: 10),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKeyIp = GlobalKey<FormState>();
    final formKeyPort = GlobalKey<FormState>();

    final HomeProvider provider = Provider.of<HomeProvider>(context);

    return Column(
      children: [
        CustomInputField(
          hintText: "DIRECCION IP",
          formKey: formKeyIp,
          onChangedHandle: (String value) =>
              provider.setIPAddress(value, context),
        ),
        SizedBox(height: 10),
        CustomInputField(
          hintText: "PUERTO",
          textInputType: TextInputType.number,
          formKey: formKeyPort,
          onChangedHandle: (String value) => provider.setPort(value, context),
        ),
      ],
    );
  }
}
