// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    IOWebSocketChannel? channel;

    void onPressHandler() {
      debugPrint("Conectando al servidor . . .");
      // IOWebSocketChannel.connect("ws://192.168.100.16:433");
      // channel.sink.add("HOLA DESDE FLUTTER!!");
    }

    return Scaffold(
      body: Container(
        color: Colors.black87,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomForm()],
        ),
      ),
    );
  }
}

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputField(
          hintText: "DIRECCION IP",
        ),
        SizedBox(height: 10),
        CustomInputField(
          hintText: "PUERTO",
          textInputType: TextInputType.number,
        ),
      ],
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;

  const CustomInputField({
    Key? key,
    required this.hintText,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        left: BorderSide(
          width: 3,
          color: Color.fromARGB(255, 255, 238, 0),
        ),
      )),
      child: TextField(
        cursorColor: Colors.white,
        cursorWidth: 3,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 168, 155, 53),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
