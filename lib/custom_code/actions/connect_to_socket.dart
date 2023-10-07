// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';

class SocketApi {
  // A static private instance to access _socketApi from inside class only
  static final SocketApi _socketApi = SocketApi._internal();

  // An internal private constructor to access it for only once for static instance of class.
  SocketApi._internal();

  // Factory constructor to return same static instance every time you create any object.
  factory SocketApi() {
    return _socketApi;
  }

  // The Socket.IO client instance
  IO.Socket? _socket;

  // Connect to the WebSocket server and return the client instance
  IO.Socket connect() {
    if (_socket == null) {
      _socket = IO.io('https://taskerpage.com/tsocket.io', <String, dynamic>{
        'transports': ['websocket'],
        'path': '/tsocket.io',
      });
    }
    return _socket!;
  }

  // Listen for an event
  void on(String event, Function(dynamic) callback) {
    _socket?.on(event, callback);
  }

  // Emit an event
  void emit(String event, dynamic data) {
    _socket?.emit(event, data);
  }
}
// Export the SocketApi class

Future connectToSocket() async {
  // Connect to the WebSocket server using the SocketApi singleton
  SocketApi().connect();
}
