// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<FFPlace>> reverseGeocode(
    double latitude, double longitude, String apiKey) async {
  final url =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyCyPQNRa7hLuEHr1tggvht9gV5kK1tHjXI';
  final response = await http.get(Uri.parse(url));
  final json = jsonDecode(response.body);
  final results = json['results'] as List<dynamic>;
  final places = results
      .map(
        (result) => FFPlace(
          name: result['formatted_address'] as String,
          latLng: result['geometry']['location'] != null
              ? LatLng(
                  result['geometry']['location']['lat'] as double,
                  result['geometry']['location']['lng'] as double,
                )
              : LatLng(0.0, 0.0),
          address: result['formatted_address'] ?? '',
          city: _getAddressComponent(result, 'locality') ?? '',
          state:
              _getAddressComponent(result, 'administrative_area_level_1') ?? '',
          country: _getAddressComponent(result, 'country') ?? '',
          zipCode: _getAddressComponent(result, 'postal_code') ?? '',
        ),
      )
      .toList();
  return places;
}

String? _getAddressComponent(Map<String, dynamic> result, String type) {
  final components = result['address_components'] as List<dynamic>;
  final component = components.firstWhere((c) {
    final types = c['types'] as List<dynamic>;
    return types.contains(type);
  }, orElse: () => null);
  return component != null ? component['long_name'] as String? : '';
}
