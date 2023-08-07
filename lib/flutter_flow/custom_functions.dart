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
  List<dynamic>? title,
  String languageCode,
) {
  if (title == null) {
    return null;
  }
  for (final item in title) {
    if (item['language'] == languageCode) {
      return item['value'];
    }
  }
  return title.first['value'];
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
