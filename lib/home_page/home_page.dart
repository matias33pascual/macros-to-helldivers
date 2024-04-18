// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channel = IOWebSocketChannel.connect("ws://192.168.100.16:433");

    void onPressHandler() {
      print("enviando data");
      channel.sink.add("HOLA DESDE FLUTTER!!");
    }

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onPressHandler,
            child: Text("Suministros"),
          ),
          StreamBuilder(
            stream: channel.stream,
            builder: ((context, snapshot) {
              return Text(snapshot.hasData
                  ? snapshot.data.toString()
                  : "Esperando mensaje");
            }),
          ),
        ],
      ),
    );
  }
}
