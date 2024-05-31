import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macro_sync_client/stratagems_page/screens/stratagems_page.dart';
import 'package:web_socket_channel/io.dart';

class ConnectionService {
  ConnectionService._();
  static final ConnectionService _instance = ConnectionService._();
  static ConnectionService get instance => _instance;

  IOWebSocketChannel? channel;
  Timer? _timeoutTimer;
  Completer<bool>? _connectionCompleter;

  Future<bool> connectToServer(
      String ip, String port, BuildContext context) async {
    try {
      if (channel == null) {
        _connectionCompleter = Completer<bool>();

        channel = IOWebSocketChannel.connect("ws://$ip:$port");

        _startTimeoutTimer();

        channel!.stream.listen((message) {
          final jsonMessage = jsonDecode(message)["message"];

          if (jsonMessage == "macrosync-server-helldivers") {
            _timeoutTimer?.cancel();

            if (!_connectionCompleter!.isCompleted) {
              _connectionCompleter!.complete(true);
            }

            if (kDebugMode) {
              print("Conexion establecida en $ip:$port");
            }

            Navigator.pushNamed(context, StratagemsPage.routeName);
          }
        }, onError: (error) {
          if (!_connectionCompleter!.isCompleted) {
            _connectionCompleter!.complete(false);
          }
          if (kDebugMode) {
            print("Error en ConnectionService.connectToServer: $error");
          }
          disconnect();
        }, onDone: () {
          if (!_connectionCompleter!.isCompleted) {
            _connectionCompleter!.complete(false);
          }
          disconnect();
        });

        return _connectionCompleter!.future;
      } else {
        if (kDebugMode) {
          print(
              "Se intento conectar al servidor pero la conexion ya habia sido realizada.");
        }

        Navigator.pushNamed(context, StratagemsPage.routeName);
        return Future.value(true);
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error en ConnectionService.connectToServer: $error");
      }

      return Future.value(false);
    }
  }

  sendMessage({String message = ""}) {
    channel?.sink.add(message);
  }

  void _startTimeoutTimer() {
    _timeoutTimer?.cancel();

    _timeoutTimer = Timer(const Duration(seconds: 5), () {
      if (kDebugMode) {
        print("No se recibió mensaje en 5 segundos. Desconectando conexion.");
      }

      if (!_connectionCompleter!.isCompleted) {
        _connectionCompleter!.complete(false);
      }

      disconnect();
    });
  }

  void disconnect() {
    if (channel != null) {
      channel!.sink.close();

      channel = null;

      if (kDebugMode) {
        print("Conexion cerrada");
      }
    }
    _timeoutTimer?.cancel();
  }
}
