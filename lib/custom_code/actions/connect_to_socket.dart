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

Future connectToSocket(
  String? endpoint,
  String? userId,
  Future<dynamic> Function()? callbackAction,
) async {
  // Add your function code here!
  IO.Socket socket = IO.io('http://209.38.224.249:9001', <String, dynamic>{
    'transports': ['websocket'],
  });

  FFAppState().globalSocket = socket;

  socket.on('connection', (_) => print('Connected'));
  socket.on('disconnect', (_) => print('Disconnected'));
  // get the message from command line and send it to the server
  socket.on('connect', (_) {
    socket.emit('join', userId);
  });
  // Listen for the chat message event
  // socket.on('latest_chat_updates', (data) => print(data));
  socket.on('latest_chat_updates', (data) => callbackAction!());
}
