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

import 'package:geocoding/geocoding.dart';

Future<List<FFPlace>?> reverseGeoCode(LatLng? geoLocation) async {
  // do the reverse geo code and return a list of places
// Check if geoLocation is null
  if (geoLocation == null) {
    return null;
  }

  // Create a GeocodingPlatform instance
  List<Placemark> placemarks = await placemarkFromCoordinates(
      _lastMapPosition.latitude, _lastMapPosition.longitude);

  // Create a list of FFPlace objects
  final places = placemarks.map((placemark) {
    return FFPlace(
      name: placemark.name ?? '',
      locality: placemark.locality ?? '',
      subLocality: placemark.subLocality ?? '',
      administrativeArea: placemark.administrativeArea ?? '',
      postalCode: placemark.postalCode ?? '',
      country: placemark.country ?? '',
      latitude: geoLocation.latitude,
      longitude: geoLocation.longitude,
    );
  }).toList();

  // Return the list of places
  return places;
}
