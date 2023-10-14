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

import 'package:url_launcher/url_launcher.dart';

Future<String> addEventToGoogleCalendar(
  String eventName,
  String eventDescription,
  DateTime eventStartDate,
  DateTime eventEndDate,
) async {
  final googleCalendarUrl = buildGoogleCalendarUrl(
    eventName: eventName,
    eventDescription: eventDescription,
    eventStartDate: eventStartDate,
    eventEndDate: eventEndDate,
  );

  return googleCalendarUrl;
}

String buildGoogleCalendarUrl({
  required String eventName,
  required String eventDescription,
  required DateTime eventStartDate,
  required DateTime eventEndDate,
}) {
  final formattedStartDate =
      DateFormat("yyyyMMdd'T'HHmmss'Z'").format(eventStartDate.toUtc());
  final formattedEndDate =
      DateFormat("yyyyMMdd'T'HHmmss'Z'").format(eventEndDate.toUtc());

  final googleCalendarUrl = Uri.encodeFull(
      'https://www.google.com/calendar/render?action=TEMPLATE&text=$eventName&dates=$formattedStartDate/$formattedEndDate&details=$eventDescription');

  return googleCalendarUrl;
}
