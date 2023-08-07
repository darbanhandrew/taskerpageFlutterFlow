import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Taskerpage Backend Group Code

class TaskerpageBackendGroup {
  static String baseUrl = 'https://taskerpage.darkube.app';
  static Map<String, String> headers = {};
  static RegisterCall registerCall = RegisterCall();
  static LoginCall loginCall = LoginCall();
  static UserProfileMeCall userProfileMeCall = UserProfileMeCall();
  static UserProfileBasicInfoCall userProfileBasicInfoCall =
      UserProfileBasicInfoCall();
  static ServiceCategoryListCall serviceCategoryListCall =
      ServiceCategoryListCall();
  static SyncUserServicesCall syncUserServicesCall = SyncUserServicesCall();
  static AddressCreateCall addressCreateCall = AddressCreateCall();
  static UploadCall uploadCall = UploadCall();
  static UserEducationAddCall userEducationAddCall = UserEducationAddCall();
  static MyEducationsCall myEducationsCall = MyEducationsCall();
  static MyAddressesCall myAddressesCall = MyAddressesCall();
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? username = '',
    String? apiGlobalKey = '',
  }) {
    final body = '''
{
  "password": "${password}",
  "username": "${username}",
  "groups": [
    3
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'register',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/iam/user/',
      callType: ApiCallType.POST,
      headers: {
        ...TaskerpageBackendGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic password(dynamic response) => getJsonField(
        response,
        r'''$.password''',
      );
  dynamic isSupserUser(dynamic response) => getJsonField(
        response,
        r'''$.is_superuser''',
      );
  dynamic username(dynamic response) => getJsonField(
        response,
        r'''$.username''',
      );
  dynamic isStaff(dynamic response) => getJsonField(
        response,
        r'''$.is_staff''',
      );
  dynamic isActive(dynamic response) => getJsonField(
        response,
        r'''$.is_active''',
      );
  dynamic dateJoined(dynamic response) => getJsonField(
        response,
        r'''$.date_joined''',
      );
  dynamic groups(dynamic response) => getJsonField(
        response,
        r'''$.groups''',
        true,
      );
  dynamic userPermissions(dynamic response) => getJsonField(
        response,
        r'''$.user_permissions''',
        true,
      );
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? apiGlobalKey = '',
  }) {
    final body = '''
{
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {
        ...TaskerpageBackendGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic refreshKey(dynamic response) => getJsonField(
        response,
        r'''$.refresh''',
      );
  dynamic apiKey(dynamic response) => getJsonField(
        response,
        r'''$.access''',
      );
}

class UserProfileMeCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileMe',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/me/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userServices(dynamic response) => getJsonField(
        response,
        r'''$.user_services''',
        true,
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
  dynamic relatedUserId(dynamic response) => getJsonField(
        response,
        r'''$.related_user.id''',
      );
  dynamic relatedUserPassword(dynamic response) => getJsonField(
        response,
        r'''$.related_user.password''',
      );
  dynamic relatedUserLogin(dynamic response) => getJsonField(
        response,
        r'''$.related_user.last_login''',
      );
  dynamic relatedUserIsSuperUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user.is_superuser''',
      );
  dynamic relatedUserUserName(dynamic response) => getJsonField(
        response,
        r'''$.related_user.username''',
      );
  dynamic relatedUserIsStaff(dynamic response) => getJsonField(
        response,
        r'''$.related_user.is_staff''',
      );
  dynamic relatedUserIsActive(dynamic response) => getJsonField(
        response,
        r'''$.related_user.is_active''',
      );
  dynamic relatedUserEmailAddress(dynamic response) => getJsonField(
        response,
        r'''$.related_user.email''',
      );
  dynamic relatedUserDateJoined(dynamic response) => getJsonField(
        response,
        r'''$.related_user.date_joined''',
      );
  dynamic relatedUserGroups(dynamic response) => getJsonField(
        response,
        r'''$.related_user.groups''',
        true,
      );
  dynamic relatedUserUserpermissions(dynamic response) => getJsonField(
        response,
        r'''$.related_user.user_permissions''',
        true,
      );
  dynamic userProfileEducation(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_educations''',
        true,
      );
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic addresses(dynamic response) => getJsonField(
        response,
        r'''$.addresses''',
        true,
      );
  dynamic reviews(dynamic response) => getJsonField(
        response,
        r'''$.reviews''',
        true,
      );
  dynamic myReviews(dynamic response) => getJsonField(
        response,
        r'''$.my_reviews''',
        true,
      );
  dynamic posts(dynamic response) => getJsonField(
        response,
        r'''$.posts''',
        true,
      );
  dynamic myBargains(dynamic response) => getJsonField(
        response,
        r'''$.my_bargains''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic myAppointments(dynamic response) => getJsonField(
        response,
        r'''$.my_appointments''',
        true,
      );
  dynamic createAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic userProfileVisibility(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_visibility''',
      );
  dynamic userTitle(dynamic response) => getJsonField(
        response,
        r'''$.user_title''',
      );
  dynamic userRole(dynamic response) => getJsonField(
        response,
        r'''$.user_role''',
      );
  dynamic driverLicnese(dynamic response) => getJsonField(
        response,
        r'''$.driver_license''',
      );
  dynamic userCountry(dynamic response) => getJsonField(
        response,
        r'''$.user_country''',
      );
  dynamic isSubscribed(dynamic response) => getJsonField(
        response,
        r'''$.is_subscribed''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic hasInsurance(dynamic response) => getJsonField(
        response,
        r'''$.has_insurance''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
}

class UserProfileBasicInfoCall {
  Future<ApiCallResponse> call({
    String? userTitle = '',
    String? accountType = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? dateOfBirth = '',
    String? id = '',
    String? apiGlobalKey = '',
  }) {
    final body = '''
{
  "user_title": "${userTitle}",
  "account_type": "${accountType}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "phone_number": "${phoneNumber}",
  "date_of_birth": "${dateOfBirth}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileBasicInfo',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/update_basic_info/',
      callType: ApiCallType.POST,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ServiceCategoryListCall {
  Future<ApiCallResponse> call({
    bool? isActive = true,
    String? apiGlobalKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'serviceCategoryList',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/service-category/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'is_active': "${isActive}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic serviceCategoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class SyncUserServicesCall {
  Future<ApiCallResponse> call({
    dynamic? userServicesListJson,
    String? apiGlobalKey = '',
  }) {
    final userServicesList = _serializeJson(userServicesListJson);
    final body = '''
${userServicesList}''';
    return ApiManager.instance.makeApiCall(
      callName: 'syncUserServices',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/user-service-bulk-sync/sync_services/',
      callType: ApiCallType.POST,
      headers: {
        ...TaskerpageBackendGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddressCreateCall {
  Future<ApiCallResponse> call({
    String? address = '',
    String? city = '',
    String? country = '',
    String? postalCode = '',
    String? state = '',
    String? streetAddress = '',
    String? aptNo = '',
    String? locationLat = '',
    String? locationLng = '',
    bool? isMainAddress,
    int? userProfile,
    String? apiGlobalKey = '',
  }) {
    final body = '''
{
  "address": "${address}",
  "city": "${city}",
  "country": "${country}",
  "postal_code": "${postalCode}",
  "state": "${state}",
  "street_address": "${streetAddress}",
  "apt_no": "${aptNo}",
  "location_lat": "${locationLat}",
  "location_lng": "${locationLng}",
  "is_main_address": ${isMainAddress},
  "user_profile": ${userProfile}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addressCreate',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/address/',
      callType: ApiCallType.POST,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic modifiedat(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.city''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.country''',
      );
  dynamic postalcode(dynamic response) => getJsonField(
        response,
        r'''$.postal_code''',
      );
  dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.state''',
      );
  dynamic streetaddress(dynamic response) => getJsonField(
        response,
        r'''$.street_address''',
      );
  dynamic aptno(dynamic response) => getJsonField(
        response,
        r'''$.apt_no''',
      );
  dynamic locationlat(dynamic response) => getJsonField(
        response,
        r'''$.location_lat''',
      );
  dynamic locationlng(dynamic response) => getJsonField(
        response,
        r'''$.location_lng''',
      );
  dynamic mainAddress(dynamic response) => getJsonField(
        response,
        r'''$.is_main_address''',
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class UploadCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? apiGlobalKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'upload',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/file',
      callType: ApiCallType.POST,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserEducationAddCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? educationLevel = '',
    String? schoolTitle = '',
    String? certificateUrl = '',
    int? relatedUserProfile,
    String? apiGlobalKey = '',
  }) {
    final body = '''
{
  "title": "${title}",
  "education_level": "${educationLevel}",
  "school_title": "${schoolTitle}",
  "certificate_url": "${certificateUrl}",
  "related_user_profile": ${relatedUserProfile}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userEducationAdd',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/education/',
      callType: ApiCallType.POST,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  dynamic educationLevel(dynamic response) => getJsonField(
        response,
        r'''$.education_level''',
      );
  dynamic schoolTitle(dynamic response) => getJsonField(
        response,
        r'''$.school_title''',
      );
  dynamic certificateURL(dynamic response) => getJsonField(
        response,
        r'''$.certificate_url''',
      );
  dynamic relatedUserProfile(dynamic response) => getJsonField(
        response,
        r'''$.related_user_profile''',
      );
}

class MyEducationsCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'myEducations',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/my_educations',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MyAddressesCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'myAddresses',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/my_addresses/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic myAddressList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

/// End Taskerpage Backend Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
