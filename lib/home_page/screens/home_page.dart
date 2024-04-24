// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
    final formKeyIp = GlobalKey<FormState>();
    final formKeyPort = GlobalKey<FormState>();

    return Column(
      children: [
        CustomInputField(
          hintText: "DIRECCION IP",
          formKey: formKeyIp,
        ),
        SizedBox(height: 10),
        CustomInputField(
          hintText: "PUERTO",
          textInputType: TextInputType.number,
          formKey: formKeyPort,
        ),
      ],
    );
  }
}

class CustomInputField extends StatefulWidget {
  final String hintText;
  final TextInputType textInputType;
  final GlobalKey formKey;

  const CustomInputField({
    Key? key,
    required this.hintText,
    this.textInputType = TextInputType.text,
    required this.formKey,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  _handleFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: _hasFocus
            ? Border(
                left: BorderSide(
                  width: 3,
                  color: Color.fromARGB(255, 255, 238, 0),
                ),
              )
            : null,
      ),
      child: TextField(
        key: widget.formKey,
        focusNode: _focusNode,
        cursorColor: Colors.white,
        cursorWidth: 3,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          fillColor:
              _hasFocus ? Color.fromARGB(255, 168, 155, 53) : Colors.black54,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
