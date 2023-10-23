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
  String serviceCategoryId,
) {
  // check if any item in list of userServices.serviceCategory has serviceCategoryId
  if (userServices == null) {
    return false;
  }
  for (final service in userServices) {
    if (service.skillCategoryName == serviceCategoryId) {
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
  String serviceCategoryId,
  bool add,
) {
  // add or remove serviceCategoryId from userServices
  if (userServices == null) {
    return [];
  }
  if (add) {
    // add serviceCategoryId to userServices
    userServices.add(UserServiceStruct(skillCategoryName: serviceCategoryId));
  } else {
    // remove serviceCategoryId from userServices
    userServices.removeWhere(
        (service) => service.skillCategoryName == serviceCategoryId);
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
    if (service.skillCategoryName == serviceCategoryId) {
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

String? convertDataTypeToTaskerFilter(TaskerFilterStruct? filter) {
  List<List<dynamic>> filterList = [];
  if (filter == null) {
    return "[]";
  }

  if (!filter.anyLocation && filter.hasAnyLocation()) {
    if (filter.hasLocationFilter()) {
      final radiusDegree = filter.locationFilter.radius / 111.00;
      final latitude = filter.locationFilter.latLng != null
          ? filter.locationFilter.latLng!.latitude
          : filter.locationFilter.latitude;
      final longitude = filter.locationFilter.latLng != null
          ? filter.locationFilter.latLng!.longitude
          : filter.locationFilter.longitude;
      filterList.add(["latitude", ">", (latitude - radiusDegree).toString()]);
      filterList.add(["latitude", "<", (latitude + radiusDegree).toString()]);
      filterList.add(["longitude", ">", (longitude - radiusDegree).toString()]);
      filterList.add(["longitude", "<", (longitude + radiusDegree).toString()]);
    }
  }

  if (filter.taskerTypeFilter.hasGender() &&
      !filter.anyTaskerGender &&
      filter.hasAnyTaskerGender()) {
    filterList.add(["gender", "=", filter.taskerTypeFilter.gender]);
  }
  // } else {
  //   // filterList.add(["gender", "=", "Doesn't matter"]);
  // }
  if (!filter.anytasker && filter.hasAnytasker()) {
    if (filter.taskerTypeFilter.hasAgeRange()) {
      DateTime currentDate = DateTime.now();
      DateTime birthDate_min;
      DateTime? birthDate_max;

      if (filter.taskerTypeFilter.ageRange == "<20") {
        birthDate_min = currentDate.subtract(Duration(days: 365 * 20));
        filterList.add([
          "date_of_birth",
          ">",
          DateFormat('yyyy-MM-dd').format(birthDate_min)
        ]);
      } else if (filter.taskerTypeFilter.ageRange == "20-40") {
        birthDate_min = currentDate.subtract(Duration(days: 365 * 40));
        birthDate_max = currentDate.subtract(Duration(days: 365 * 20));
        filterList.add([
          "date_of_birth",
          ">",
          DateFormat('yyyy-MM-dd').format(birthDate_max)
        ]);
        filterList.add([
          "date_of_birth",
          "<",
          DateFormat('yyyy-MM-dd').format(birthDate_min)
        ]);
      } else if (filter.taskerTypeFilter.ageRange == "40>") {
        birthDate_min = currentDate.subtract(Duration(days: 365 * 40));
        filterList.add([
          "date_of_birth",
          "<",
          DateFormat('yyyy-MM-dd').format(birthDate_min)
        ]);
      }
    }

    if (filter.taskerTypeFilter.hasHasIdentification()) {
      filterList.add([
        "identified",
        "=",
        filter.taskerTypeFilter.hasIdentification ? "1" : "0"
      ]);
    }

    if (filter.taskerTypeFilter.hasHasInsurance()) {
      filterList.add(
          ["insurance", "=", filter.taskerTypeFilter.hasInsurance ? "1" : "0"]);
    }
  }

  // if (filterList.isEmpty) {
  //   return "[]";
  // }
  if (filterList.isEmpty) {
    List<dynamic> finalFilter = [];
    if (!filter.anySkill && filter.hasNames()) {
      finalFilter.add(['"name"', '"in"', filter.names]);
    }
    return finalFilter.toString();
  }
  List<dynamic> finalFilter = filterList.map((item) {
    return '[${item.map((e) => '"$e"').join(',')}]';
  }).toList();
  if (!filter.anySkill && filter.hasNames()) {
    finalFilter.add(['"name"', '"in"', filter.names]);
  }
  return finalFilter.toString();
}

String convertDataTypeToTaskerSkillFilter(SkillFilterStruct? filter) {
  if (filter == null) {
    return "[]";
  }

  List<List<String>> filterList = [];

  if (filter.hasSkillCategoryName()) {
    filterList.add(["skill_category_name", "=", filter.skillCategoryName]);
  }
  if (filter.hasSkillName()) {
    filterList.add(["skill_name", "=", filter.skillName]);
  }
  if (filter.hasSkillLevel()) {
    filterList.add(["skill_level", "=", filter.skillLevel]);
  }

  if (filterList.isEmpty) {
    return "[]";
  }

  List<String> finalFilter = filterList.map((item) {
    return '[${item.map((e) => '"$e"').join(',')}]';
  }).toList();
  return finalFilter.toString();
}

dynamic userServicesToJson(List<UserServiceStruct>? userServices) {
  // convert list of UserServiceStruct to json list
  if (userServices == null) {
    return null;
  }
  final userServicesList = [];
  for (final userService in userServices) {
    userServicesList.add({
      'service': userService.skillName,
      'service_category': userService.skillCategoryName,
      'service_skill_level': userService.skillLevel,
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
      skillName: userServiceJson['skill_name'],
      skillCategoryName: userServiceJson['skill_category_name'],
      skillLevel: userServiceJson['skill_level'],
    ));
  }
  return userServices;
}

List<dynamic> getSelectedServiceCategoriesJson(
  List<String> selectedServiceCategoryIds,
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

  return ['Educated Professional', 'Experienced Self-Trained', 'Self trained'];
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
  final List<String> daysOfWeek = [
    'Sundays',
    'Mondays',
    'Tuesdays',
    'Wednesdays',
    'Thursdays',
    'Fridays',
    'Saturdays'
  ];
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

String? convertStringtoAllCaps(String? lowercased) {
  // convert String to All Caps
  if (lowercased == null) {
    return null;
  } else {
    return lowercased.toUpperCase();
  }
}

String? capitalizeFirstLetter(String? input) {
  if (input == null) {
    return null;
  }

  return input.toUpperCase()[0] + input.substring(1).toLowerCase();
}

List<int> jsonListToIntList(dynamic jsonInput) {
  // convert a json object which is a list of strings to a list of string (like $.data[:].name)
  if (jsonInput is List<dynamic>) {
    List<int> intList = [];
    for (dynamic item in jsonInput) {
      if (item is int) {
        intList.add(item);
      }
    }
    return intList;
  }
  return [];
}

List<String>? convertStringToListOfString2(String? input) {
  // input is a json path and the value is "Option1, Option2", parse and trim
  if (input == null) {
    return [];
  }
  final jsonString = input.toString();
  final options = jsonString.split(',');
  final trimmedOptions = options.map((option) => option.trim()).toList();
  return trimmedOptions;
}

String? convertShortWeekDayToLong(List<String>? weekday) {
  // convert List of short weekdays to a list of long weekdays concatenated
  if (weekday == null) {
    return null;
  }
  final longWeekdays = <String>[];
  for (final day in weekday) {
    switch (day) {
      case 'Mon':
        longWeekdays.add('Monday');
        break;
      case 'Tue':
        longWeekdays.add('Tuesday');
        break;
      case 'Wed':
        longWeekdays.add('Wednesday');
        break;
      case 'Thu':
        longWeekdays.add('Thursday');
        break;
      case 'Fri':
        longWeekdays.add('Friday');
        break;
      case 'Sat':
        longWeekdays.add('Saturday');
        break;
      case 'Sun':
        longWeekdays.add('Sunday');
        break;
      default:
        break;
    }
  }
  return longWeekdays.join(', ');
}

List<String>? stringToArrayOfString(String? input) {
  // convert string to array of string
  if (input == null) {
    return null;
  }
  final List<String> result = [];
  result.add(input);
  return result;
}

dynamic calendarDataToJson(PosCalendarStruct? calendarData) {
  if (calendarData == null) {
    return null;
  }
  final String? startTimeString;
  if (calendarData.exactStartTime != null) {
    startTimeString =
        '${calendarData.exactStartTime?.hour.toString().padLeft(2, '0')}:${calendarData.exactStartTime?.minute.toString().padLeft(2, '0')}:${calendarData.exactStartTime?.second.toString().padLeft(2, '0')}';
  } else {
    startTimeString = null;
  }

  return {
    if (calendarData.startDate != null)
      // it should be 2023-01-01
      'start_date': calendarData.startDate?.toIso8601String(),
    'is_periodic': calendarData.isPeriodic,
    'period_type': calendarData.periodType,
    'end_date_type': calendarData.endType,
    if (calendarData.endDateOn != null)
      'end_datetime': calendarData.endDateOn?.toIso8601String(),
    if (calendarData.endDateAfterSessions != null)
      'num_sessions': calendarData.endDateAfterSessions,
    if (calendarData.isExactStartingTime != null &&
        !calendarData.isExactStartingTime)
      'range_start_time': calendarData.rangeStartTime,
    if (calendarData.sessionDuration != null)
      // it should be 01:00:00
      'session_duration': calendarData.sessionDuration,
    if (calendarData.periodicPreferredWeekDays != null)
      'days_of_week': calendarData.periodicPreferredWeekDays,
    if (calendarData.periodicPreferredWeekDays != null)
      'preferred_days':
          convertShortWeekDayToLong(calendarData.periodicPreferredWeekDays),
    if (calendarData.customPeriodicType != null)
      'repeat_type': calendarData.customPeriodicType,
    if (calendarData.isExactStartingTime != null &&
        calendarData.isExactStartingTime)
      'start_time': 'custom',
    if (startTimeString != null) 'custom_start_time': startTimeString,
  };
}

String extractNumber(String phone) {
  String numericText = phone.replaceAll(RegExp(r'[^0-9]'), '');

  return numericText;
}

String? arrayToString(List<String>? languagesList) {
  // convert array to string
  if (languagesList == null || languagesList.isEmpty) {
    return null;
  }
  return languagesList.join(',');
}

String? convertDataTypeToFilter(FilterStruct? filter) {
  List<List<String>> filterList = [];
  if (filter == null) {
    return null;
  }
  if (!filter.anyLocation && filter.hasAnyLocation()) {
    final radiusDegree = filter.locationFilter.radius / 111.00;
    final latitude = filter.locationFilter.latLng != null
        ? filter.locationFilter.latLng!.latitude
        : filter.locationFilter.latitude;
    final longitude = filter.locationFilter.latLng != null
        ? filter.locationFilter.latLng!.longitude
        : filter.locationFilter.longitude;
    filterList.add(["latitude", ">", (latitude - radiusDegree).toString()]);
    filterList.add(["latitude", "<", (latitude + radiusDegree).toString()]);
    filterList.add(["longitude", "<", (longitude + radiusDegree).toString()]);
    filterList.add(["longitude", ">", (longitude - radiusDegree).toString()]);
  }
  if (!filter.anySkill) {
    if (filter.skillFilter.skillCategoryName != "") {
      filterList.add(
          ["skill_category_name", "=", filter.skillFilter.skillCategoryName]);
    }
    if (filter.skillFilter.skillName != "") {
      filterList.add(["skill_name", "=", filter.skillFilter.skillName]);
    }
    if (filter.skillFilter.skillLevel != "") {
      filterList.add(["skill_level", "=", filter.skillFilter.skillLevel]);
    }
  }
  if (!filter.anyDate && filter.dateFilter != null) {
    DateTime dateFilter = filter.dateFilter ?? DateTime(2020);
    filterList
        .add(["start_date", ">", DateFormat('yyyy-MM-dd').format(dateFilter)]);
  }
  if (!filter.anyTaskerGender && filter.taskerTypeFilter.hasGender()) {
    filterList.add(["tasker_gender", "=", filter.taskerTypeFilter.gender]);
  }

  if (filter.taskerTypeFilter.hasAgeRange()) {
    filterList.add(["tasker_age_range", "=", filter.taskerTypeFilter.ageRange]);
  }

  if (filter.taskerTypeFilter.hasHasIdentification() && !filter.anytasker) {
    filterList.add([
      "identified",
      "=",
      filter.taskerTypeFilter.hasIdentification ? "1" : "0"
    ]);
  }
  if (filter.taskerTypeFilter.hasHasInsurance() && !filter.anytasker) {
    filterList.add(
        ["insurance", "=", filter.taskerTypeFilter.hasInsurance ? "1" : "0"]);
  }
  if (filter.hasOnlyOpen() && !filter.onlyOpen) {
    filterList.add(["docstatus", "=", "2"]);
  } else {
    filterList.add(["docstatus", "=", "1"]);
  }
  List<String> finalFilter = filterList.map((item) {
    return '[${item.map((e) => '"$e"').join(',')}]';
  }).toList();
  return finalFilter.toString();
}

List<LatLng>? jsonListToLatLng(List<dynamic>? jsonList) {
  if (jsonList == null) {
    return null;
  }

  List<LatLng> latLngList = [];

  for (var json in jsonList) {
    if (json["latitude"] is String && json["longitude"] is String) {
      double? latitude = double.tryParse(json["latitude"]);
      double? longitude = double.tryParse(json["longitude"]);

      if (latitude != null && longitude != null) {
        latLngList.add(LatLng(latitude, longitude));
      }
    } else if (json["latitude"] is double && json["longitude"] is double) {
      latLngList.add(LatLng(json["latitude"], json["longitude"]));
    }
  }

  return latLngList;
}

String? findNameByChosenLatLngFromJsonList(
  LatLng? chosenLatLng,
  List<dynamic>? jsonList,
) {
  if (chosenLatLng == null || jsonList == null) return null;
  double? parseDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  return jsonList.firstWhere(
    (json) {
      double? jsonLatitude = parseDouble(json['latitude']);
      double? jsonLongitude = parseDouble(json['longitude']);

      return jsonLatitude != null &&
          jsonLongitude != null &&
          (chosenLatLng.latitude - jsonLatitude).abs() <= 0.001 &&
          (chosenLatLng.longitude - jsonLongitude).abs() <= 0.001;
    },
    orElse: () => null,
  )?["name"]?.toString();
}

List<String>? jsonListToStringList(List<dynamic>? jsonInput) {
  // convert a json object which is a list of strings to a list of string (like $.data[:].name)
  if (jsonInput is List<dynamic>) {
    List<String> stringList = [];
    for (dynamic item in jsonInput) {
      if (item is String) {
        stringList.add(item);
      } else {
        stringList.add(item.toString());
      }
    }
    return stringList;
  }
  return [];
}

dynamic returnJsonByNameFromJsonList(
  dynamic inputJson,
  String? name,
) {
  // filterJsonListInput By name, name may be int or string in json,compare as string, return json
  if (inputJson is List) {
    List<dynamic> filteredList = [];
    for (var item in inputJson) {
      if (item is Map && item.containsKey(name)) {
        dynamic value = item[name];
        if (value is String || value is int) {
          if (value.toString() == name) {
            filteredList.add(item);
          }
        }
      }
    }
    return filteredList;
  }
  return null;
}

dynamic setUpdateAppointmentStatusBody(
  dynamic userProfile,
  bool isAccepted,
) {
  String roleName =
      userProfile['data']['role_profile_name'].toString().toLowerCase();
  String key = "is_${roleName}_accepted";
  int value = isAccepted ? 1 : 0;
  int docstatusValue = isAccepted ? 1 : 2;
  Map<String, dynamic> body = {
    key: value.toString(),
    "docstatus": docstatusValue.toString(),
  };

  return body;
}

bool? jsonToBoll(dynamic json) {
  // convert json to boll
  if (json is bool) {
    return json;
  } else if (json is String) {
    return json.toLowerCase() == 'true';
  } else {
    return null;
  }
}

String? getLatLngAsString(
  LatLng? latLng,
  bool? falseLatTrueLng,
) {
  // write a function that based on flaseLatTrueLng returns from latLng as string
  if (latLng == null) {
    return null;
  }
  if (falseLatTrueLng == null) {
    return latLng.toString();
  }
  if (falseLatTrueLng) {
    return latLng.longitude.toString();
  } else {
    return latLng.latitude.toString();
  }
}

DateTime? jsonToDateTime(String? dateStrAsJson) {
  if (dateStrAsJson == null) {
    return null;
  }

  // Check if the input matches HH:MM:ss format
  if (RegExp(r'^\d{2}:\d{2}:\d{2}$').hasMatch(dateStrAsJson)) {
    // Parse time in HH:MM:ss format
    return DateTime.parse('1970-01-01 $dateStrAsJson');
  }
  if (RegExp(r'^\d{1}:\d{2}:\d{2}$').hasMatch(dateStrAsJson)) {
    // Parse time in HH:MM:ss format
    return DateTime.parse('1970-01-01 0$dateStrAsJson');
  }
  // Check if the input matches yyyy-MM-dd format
  if (RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(dateStrAsJson)) {
    // Parse date in yyyy-MM-dd format
    return DateTime.parse(dateStrAsJson);
  }

  // Check if the input matches yyyy-MM-dd HH:MM:ss format
  if (RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{6}$')
      .hasMatch(dateStrAsJson)) {
    // Parse date and time in yyyy-MM-dd HH:MM:ss.SSSSSS format
    return DateTime.parse(dateStrAsJson);
  }

  // Return null for unrecognized format
  return null;
}

LatLng fulllatLong(
  String? lat,
  String? long,
) {
  // lat and long arguments and return latlang type
  if (lat == null || long == null) {
    return LatLng(0.0, 0.0);
  }
  final latitude = double.tryParse(lat);
  final longitude = double.tryParse(long);
  if (latitude == null || longitude == null) {
    return LatLng(0.0, 0.0);
  }
  return LatLng(latitude, longitude);
}

String? jsonListOfStringToString(List<dynamic>? json) {
  // convert ["8","9"] as json to ["8","9"] as string
  return json?.map((e) => e.toString()).toList().toString();
}

List<String>? convertStringtoListOfString(String? input) {
  // convert string like "En,DE" to ["En","De"]
  // String input = "En,DE";
  if (input == null) {
    return [];
  }
  List<String> output = input.split(",");
  return output;
}

bool? checkLenghtlist(dynamic list) {
  // if list lenght Entrance equle to 0 return false else return true
  if (list.length == 0) {
    return false;
  } else {
    return true;
  }
}

String? fullName(
  String? firstname,
  String? lastName,
) {
  // name and family convert to name+family
  if (firstname == null || lastName == null) {
    return null;
  }
  return '$firstname+$lastName';
}

List<String>? convertStringToListOfString(dynamic input) {
  // input is a json path and the value is "Option1, Option2", parse and trim
  if (input == null) {
    return [];
  }
  final jsonString = input.toString();
  final options = jsonString.split(',');
  final trimmedOptions = options.map((option) => option.trim()).toList();
  return trimmedOptions;
}

List<SkillOptionsStruct>? convertJsonListToDataTypeList(
    List<dynamic>? inputJsonList) {
  if (inputJsonList == null || inputJsonList.isEmpty) {
    return []; // Return null if the input list is null or empty
  }

  List<SkillOptionsStruct> result = [];

  for (var jsonItem in inputJsonList) {
    if (jsonItem is Map<String, dynamic>) {
      // Assuming SkillOptionsStruct can be constructed from a Map
      SkillOptionsStruct skillOptions = SkillOptionsStruct(
          name: jsonItem["option_name"],
          type: jsonItem["type"],
          values: jsonItem["values"]);

      result.add(skillOptions);
    }
  }

  return result.isNotEmpty ? result : [];
}

List<dynamic>? convertDataTypeListToJsonList(
    List<SkillOptionsStruct>? skillOptions) {
  if (skillOptions == null || skillOptions.isEmpty) {
    return null; // Return null if the input list is null or empty
  }

  List<dynamic> result = [];

  for (SkillOptionsStruct skillOption in skillOptions) {
    result.add({
      "option_name": skillOption.name,
      "type": skillOption.type,
      "values": skillOption.values
    });
  }
  return result;
}

String? convertListOfStringToString(List<String>? listString) {
  // convert list of string to string with ","
  if (listString == null || listString.isEmpty) {
    return null;
  }
  return listString.join(',');
}

bool jsonIntToBoolean(dynamic jsonInt) {
  // convert jsonInt as 0 or 1 in json to Boolean
  if (jsonInt == 1) {
    return true;
  } else if (jsonInt == 0) {
    return false;
  } else {
    return false;
  }
}

int? booltoInt(bool? boolean) {
  // convert bool to int
  if (boolean == null) {
    return null;
  } else {
    return boolean ? 1 : 0;
  }
}

double? calculateNetTotal(
  double? discount,
  bool? isPercentage,
  double? grandTotal,
) {
  if (discount == null || grandTotal == null || isPercentage == null) {
    print("Invalid input parameters");
    return null;
  }

  double netTotal;

  if (isPercentage) {
    // If discount is a percentage, calculate the net total accordingly
    double discountAmount = (discount / 100) * grandTotal;
    netTotal = grandTotal - discountAmount;
  } else {
    // If discount is a fixed amount, subtract it directly from the grand total
    netTotal = grandTotal - discount;
  }

  return netTotal;
}

double? convertJsonDoubleToDouble(dynamic jsonDouble) {
  // convert JsonDouble To Double
  if (jsonDouble is double) {
    return jsonDouble;
  } else if (jsonDouble is int) {
    return jsonDouble.toDouble();
  } else if (jsonDouble is String) {
    return double.tryParse(jsonDouble);
  } else {
    return 0.0;
  }
}

int? getRemaningTime(DateTime? endDate) {
  // Subtract the endDate from the current time and convert it to milliseconds
  if (endDate == null) {
    return null;
  }
  final now = DateTime.now();
  final remainingTime = endDate.difference(now).inMilliseconds;
  return math.max(0, remainingTime);
}

int? remaningPlan(DateTime? endDate) {
  // Subtract the endDate from the current time and give the number of days left
  if (endDate == null) {
    return null;
  }
  final now = DateTime.now();
  final remainingTime = endDate.difference(now);
  final remainingDays = remainingTime.inDays;
  return remainingDays >= 0 ? remainingDays : null;
}

dynamic returnJsonByFieldFromListOfJson(
  String? inputListJson,
  String idFieldName,
  String? fieldValue,
) {
  // write a function that returns json object from inputJsonList where json[idFieldName]==fieldValue
  if (inputListJson == null || fieldValue == null) {
    return null;
  }

  final List<dynamic> jsonList = json.decode(inputListJson);
  final Map<String, dynamic> result = {};

  for (final json in jsonList) {
    if (json[idFieldName] == fieldValue) {
      result.addAll(json);
      break;
    }
  }

  return result.isNotEmpty ? result : null;
}

bool isLatLngNullIsland(LatLng latLng) {
  // check if LatLng is 0.0,0.0 and return true, other wise return false
  if (latLng.latitude == 0.0 && latLng.longitude == 0.0) {
    return true;
  } else {
    return false;
  }
}

int? doubleToint(double? slider) {
  // convert double to int
  if (slider == null) {
    return null;
  } else {
    return slider.toInt();
  }
}

String? removeChar(String? phone) {
  // phone convert to trim and remove 4 char fraom first
  if (phone == null || phone.length < 4) {
    return null;
  }
  return phone.substring(5).trim();
}

List<SkillOptionsStruct>? convertListOfSkillOptionsJsonToListOfDataType(
    List<dynamic>? skillOptions) {
  // convert json list to skillOptions
  if (skillOptions == null) {
    return null;
  }

  final List<SkillOptionsStruct> options = [];

  for (final option in skillOptions) {
    final Map<String, dynamic> optionMap = option as Map<String, dynamic>;
    final String name = optionMap['option_name'] as String;
    final String type = optionMap['type'] as String;
    final String values = optionMap['values'] as String;

    options.add(SkillOptionsStruct(name: name, type: type, values: values));
  }

  return options;
}

bool stringToBoolean(String? inputString) {
  // string is true or false or null, convert it to bool with default false
  if (inputString == null) {
    return false;
  } else if (inputString.toLowerCase() == 'true') {
    return true;
  } else {
    return false;
  }
}

int? getLengthMyList(List<dynamic>? input) {
  // get my arguments list length
  if (input == null) {
    return null;
  } else {
    return input.length;
  }
}

double? jsonTodouble(dynamic input) {
  // covert json to double
  try {
    return double.parse(input.toString());
  } catch (e) {
    return null;
  }
}

int? plus1(int? num1) {
  // return num1 plus 1
  return num1 != null ? num1 + 1 : null;
}

String getOpEmail(
  String? membersListString,
  String? removeEmail,
) {
  if (membersListString == null || removeEmail == null) {
    return ''; // Handle null inputs as needed.
  }

  // Split the membersListString into a list of email addresses.
  List<String> membersList = membersListString.split(', ');

  // Remove the specified email from the list.
  membersList.remove(removeEmail);

  // Join the updated list back into a string with commas and spaces.
  String updatedMembersListString = membersList[0];

  return updatedMembersListString;
}

int? numberofListitems(List<String>? list) {
  // get me Number of list items
  if (list == null) {
    return null;
  } else {
    return list.length;
  }
}

int? stringToInt(String? string) {
  // convert string to int format
  if (string == null) {
    return null;
  }
  return int.tryParse(string);
}

int? multiplication(
  int? int1,
  int? int2,
) {
  // Multiply the first number by the second

  if (int1 != null && int2 != null) {
    return int1 * int2;
  }
  return null;
}

List<SkillStruct>? returnSelectedSkillsBooleanList(
  List<bool> checkedSkills,
  List<SkillStruct> skillList,
) {
  if (checkedSkills.length != skillList.length) {
    // This check ensures that the lengths of the two lists match.
    // If they don't match, it returns null as a sign of error.
    return null;
  }

  List<SkillStruct> selectedSkills = [];

  for (int i = 0; i < checkedSkills.length; i++) {
    if (checkedSkills[i]) {
      selectedSkills.add(skillList[i]);
    }
  }

  return selectedSkills;
}

String? returnSingleTrueIndex(List<bool>? booleanList) {
  return "hello";
}
