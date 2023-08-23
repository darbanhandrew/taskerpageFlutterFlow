import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

bool checkIfServiceCategoryExists(
  List<UserServiceStruct>? userServices,
  int serviceCategoryId,
) {
  // check if any item in list of userServices.serviceCategory has serviceCategoryId
  if (userServices == null) {
    return false;
  }
  for (final service in userServices) {
    if (service.serviceCategory == serviceCategoryId) {
      return true;
    }
  }
  return false;
}

dynamic latLngToJson(LatLng? latlng) {
  // convert latlng to json
  if (latlng == null) {
    return null;
  }
  return {
    'lat': latlng.latitude,
    'lng': latlng.longitude,
  };
}

List<UserServiceStruct> updateUserServices(
  List<UserServiceStruct>? userServices,
  int serviceCategoryId,
  bool add,
) {
  // add or remove serviceCategoryId from userServices
  if (userServices == null) {
    return [];
  }
  if (add) {
    // add serviceCategoryId to userServices
    userServices.add(UserServiceStruct(serviceCategory: serviceCategoryId));
  } else {
    // remove serviceCategoryId from userServices
    userServices
        .removeWhere((service) => service.serviceCategory == serviceCategoryId);
  }
  return userServices;
}

List<UserServiceStruct> addUserService(
  List<UserServiceStruct>? userServices,
  int serviceId,
  int serviceCategoryId,
  bool add,
) {
  if (userServices == null) {
    userServices = [];
  }

  if (add) {
    // Check if the serviceId and serviceCategoryId tuple already exists in the list
    if (userServices.any((userService) =>
        userService.service == serviceId &&
        userService.serviceCategory == serviceCategoryId)) {
      // If it does, return the original list
      return userServices;
    } else {
      // If it doesn't, add a new UserServiceStruct to the list with the given serviceId and serviceCategoryId
      userServices.add(UserServiceStruct(
          service: serviceId, serviceCategory: serviceCategoryId));
    }
  } else {
    // Remove the UserServiceStruct with the given serviceId and serviceCategoryId from the list
    userServices.removeWhere((userService) =>
        userService.service == serviceId &&
        userService.serviceCategory == serviceCategoryId);
  }

  return userServices;
}

List<UserServiceStruct> updateServiceSkillLevel(
  List<UserServiceStruct>? userServices,
  int serviceId,
  int serviceCategoryId,
  String skillLevel,
) {
  if (userServices == null) {
    userServices = [];
  }

  // Check if the serviceId and serviceCategoryId tuple already exists in the list
  if (userServices.any((userService) =>
      userService.service == serviceId &&
      userService.serviceCategory == serviceCategoryId)) {
    // If it does, update or remove the skillLevel based on whether it's null or not
    if (skillLevel == null) {
      userServices
          .firstWhere((userService) =>
              userService.service == serviceId &&
              userService.serviceCategory == serviceCategoryId)
          .serviceSkillLevel = null;
    } else {
      userServices
          .firstWhere((userService) =>
              userService.service == serviceId &&
              userService.serviceCategory == serviceCategoryId)
          .serviceSkillLevel = skillLevel;
    }
  } else {
    // If it doesn't, add a new UserServiceStruct to the list with the given serviceId and serviceCategoryId
    userServices.add(UserServiceStruct(
        service: serviceId,
        serviceCategory: serviceCategoryId,
        serviceSkillLevel: skillLevel));
  }

  return userServices;
}

bool checkIfServiceExists(
  List<UserServiceStruct>? userServices,
  int serviceId,
  int serviceCategoryId,
) {
  // check if any item in list of userServices.serviceCategory has serviceCategoryId
  if (userServices == null) {
    return false;
  }
  for (final service in userServices) {
    if (service.service == serviceId &&
        service.serviceCategory == serviceCategoryId) {
      return true;
    }
  }
  return false;
}

String? getTranslatableItemString(
  dynamic title,
  String languageCode,
  String? key,
) {
  // return title[languageCode][key] or not found
  if (title == null || languageCode == null || key == null) {
    return null;
  }

  if (title[languageCode] != null && title[languageCode][key] != null) {
    return title[languageCode][key];
  }

  return 'not found';
}

dynamic userServicesToJson(List<UserServiceStruct>? userServices) {
  // convert list of UserServiceStruct to json list
  if (userServices == null) {
    return null;
  }
  final userServicesList = [];
  for (final userService in userServices) {
    userServicesList.add({
      'service': userService.service,
      'service_category': userService.serviceCategory,
      'service_skill_level': userService.serviceSkillLevel,
    });
  }
  return userServicesList;
}

List<UserServiceStruct> jsonToUserServices(dynamic userServicesJson) {
  if (userServicesJson == null) {
    return [];
  }
  final userServices = <UserServiceStruct>[];
  for (final userServiceJson in userServicesJson) {
    userServices.add(UserServiceStruct(
      service: userServiceJson['service'],
      serviceCategory: userServiceJson['service_category'],
      serviceSkillLevel: userServiceJson['service_skill_level'],
    ));
  }
  return userServices;
}

List<dynamic> getSelectedServiceCategoriesJson(
  List<int> selectedServiceCategoryIds,
  dynamic servieCategoriesJson,
) {
  // return all objects in serviceCategoriesJson which their id is included in selectedServiceCategoryIds
  final selectedServiceCategoriesJson = <dynamic>[];
  for (final serviceCategoryJson in servieCategoriesJson) {
    if (selectedServiceCategoryIds.contains(serviceCategoryJson['id'])) {
      selectedServiceCategoriesJson.add(serviceCategoryJson);
    }
  }
  return selectedServiceCategoriesJson;
}

List<String> returnSkillLevelEnums() {
  /// [ EDUCATED_PROFESSIONALS, EXPERIENCED_SELF_TRAINED, SELF_TRAINED ]

  return ['EDUCATED_PROFESSIONALS', 'EXPERIENCED_SELF_TRAINED', 'SELF_TRAINED'];
}

String? jsonToString(dynamic json) {
  // convert a simple json field to string
  if (json == null) {
    return null;
  } else if (json is String) {
    return json;
  } else {
    return json.toString();
  }
}

int? jsonToInt(dynamic json) {
  // convert json to int
  if (json is int) {
    return json;
  } else if (json is String) {
    return int.tryParse(json);
  } else {
    return null;
  }
}

List<dynamic> generateDaysOfWeekRange() {
  // generate an array of objects for each day of week, short and long name
  final List<String> daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final List<String> daysOfWeekShort = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  final List<Map<String, String>> days = [];

  for (int i = 0; i < daysOfWeek.length; i++) {
    days.add({
      'name': daysOfWeek[i],
      'shortName': daysOfWeekShort[i],
    });
  }

  return days;
}
