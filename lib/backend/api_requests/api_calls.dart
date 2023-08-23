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
  static GetServicesCall getServicesCall = GetServicesCall();
  static CreateUserServiceCall createUserServiceCall = CreateUserServiceCall();
  static EditUserServiceCall editUserServiceCall = EditUserServiceCall();
  static GetUserServiceByIdCall getUserServiceByIdCall =
      GetUserServiceByIdCall();
  static DeleteUserServiceByIdCall deleteUserServiceByIdCall =
      DeleteUserServiceByIdCall();
  static SetAddressMainCall setAddressMainCall = SetAddressMainCall();
  static DeleteAddressCall deleteAddressCall = DeleteAddressCall();
  static MyServicesCall myServicesCall = MyServicesCall();
  static ChangeMyRoleCall changeMyRoleCall = ChangeMyRoleCall();
  static ChangeProfileDeatelsCall changeProfileDeatelsCall =
      ChangeProfileDeatelsCall();
  static ChangeDescriptionAndProfileImageCall
      changeDescriptionAndProfileImageCall =
      ChangeDescriptionAndProfileImageCall();
  static MyPostsCall myPostsCall = MyPostsCall();
  static CreatePostCall createPostCall = CreatePostCall();
  static UpdatePostCall updatePostCall = UpdatePostCall();
  static InitiatePostCall initiatePostCall = InitiatePostCall();
  static SinglePostReadCall singlePostReadCall = SinglePostReadCall();
  static UserProfileListCall userProfileListCall = UserProfileListCall();
  static UserProfileReadCall userProfileReadCall = UserProfileReadCall();
  static PostsCall postsCall = PostsCall();
  static PostReadCall postReadCall = PostReadCall();
  static AppointmentListCall appointmentListCall = AppointmentListCall();
  static AppointmentReadCall appointmentReadCall = AppointmentReadCall();
  static CreateAppointmentCall createAppointmentCall = CreateAppointmentCall();
  static AppointmentUpdateCall appointmentUpdateCall = AppointmentUpdateCall();
  static MyAppointmentCall myAppointmentCall = MyAppointmentCall();
  static MyBargainsCall myBargainsCall = MyBargainsCall();
  static ServiceCategoryCall serviceCategoryCall = ServiceCategoryCall();
  static MyBargainsPostCall myBargainsPostCall = MyBargainsPostCall();
  static MyReviewsCall myReviewsCall = MyReviewsCall();
  static ReviewsAboutMeCall reviewsAboutMeCall = ReviewsAboutMeCall();
  static SendVerifacationCall sendVerifacationCall = SendVerifacationCall();
  static CheckVerficationCall checkVerficationCall = CheckVerficationCall();
  static UpdateUserProfileCall updateUserProfileCall = UpdateUserProfileCall();
  static StripeCall stripeCall = StripeCall();
  static GetUserServicesCall getUserServicesCall = GetUserServicesCall();
  static EducationPartialUpdateCall educationPartialUpdateCall =
      EducationPartialUpdateCall();
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? username = '',
    String? apiAppKey = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.related_user.first_name''',
      );
  dynamic family(dynamic response) => getJsonField(
        response,
        r'''$.related_user.last_name''',
      );
  dynamic reviewAverage(dynamic response) => getJsonField(
        response,
        r'''$.review_average''',
      );
  dynamic avatar(dynamic response) => getJsonField(
        response,
        r'''$.avatar''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic selectedServicesCategory(dynamic response) => getJsonField(
        response,
        r'''$.user_services[:].service_category.id''',
        true,
      );
  dynamic selectedServices(dynamic response) => getJsonField(
        response,
        r'''$.user_services[:].service.id''',
        true,
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
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
  dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$[:].lat_lang.lat''',
        true,
      );
  dynamic lng(dynamic response) => getJsonField(
        response,
        r'''$[:].lat_lang.lang''',
        true,
      );
}

class GetServicesCall {
  Future<ApiCallResponse> call({
    String? category = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getServices',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/service/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'category': category,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic servicesList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class CreateUserServiceCall {
  Future<ApiCallResponse> call({
    int? serviceCategory,
    int? service,
    String? serviceSkillLevel = '',
    int? userProfile,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "service_options": [],
  "service_skill_level": "${serviceSkillLevel}",
  "service_category": ${serviceCategory},
  "service": ${service},
  "user_profile": ${userProfile}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUserService',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-service/',
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
  dynamic createAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class EditUserServiceCall {
  Future<ApiCallResponse> call({
    int? serviceCategory,
    int? service,
    String? serviceSkillLevel = '',
    int? userProfile,
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "service_skill_level": "${serviceSkillLevel}",
  "service_category": ${serviceCategory},
  "service": ${service},
  "user_profile": ${userProfile}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editUserService',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-service/${id}/',
      callType: ApiCallType.PUT,
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
  dynamic createAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class GetUserServiceByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserServiceById',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-service/${id}/',
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
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic serviceOptions(dynamic response) => getJsonField(
        response,
        r'''$.service_options''',
        true,
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class DeleteUserServiceByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUserServiceById',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-service/${id}/',
      callType: ApiCallType.DELETE,
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
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic serviceOptions(dynamic response) => getJsonField(
        response,
        r'''$.service_options''',
        true,
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class SetAddressMainCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setAddressMain',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/address/${id}/set_main/',
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
  dynamic errors(dynamic response) => getJsonField(
        response,
        r'''$.errors''',
        true,
      );
}

class DeleteAddressCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteAddress',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/address/${id}/delete/',
      callType: ApiCallType.DELETE,
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

class MyServicesCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'myServices',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/my_services/',
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

  dynamic myServices(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class ChangeMyRoleCall {
  Future<ApiCallResponse> call({
    int? id,
    String? userRole = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "user_role": "${userRole}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeMyRole',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/',
      callType: ApiCallType.PUT,
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
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
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
  dynamic driverlicense(dynamic response) => getJsonField(
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
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
}

class ChangeProfileDeatelsCall {
  Future<ApiCallResponse> call({
    int? id,
    bool? hasInsurance,
    int? yearsOfExperience,
    String? driverLicense = '',
    List<String>? userLanguagesList,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final userLanguages = _serializeList(userLanguagesList);

    final body = '''
{
  "user_languages": 
    ${userLanguages}
  ,
  "driver_license": "${driverLicense}",
  "years_of_experience": ${yearsOfExperience},
  "has_insurance": ${hasInsurance}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeProfileDeatels',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/',
      callType: ApiCallType.PUT,
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
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
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
  dynamic driverlicense(dynamic response) => getJsonField(
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
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
}

class ChangeDescriptionAndProfileImageCall {
  Future<ApiCallResponse> call({
    int? id,
    String? description = '',
    String? avatar = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "description": "${description}",
  "avatar_url": "${avatar}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeDescriptionAndProfileImage',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/',
      callType: ApiCallType.PUT,
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
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
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
  dynamic driverlicense(dynamic response) => getJsonField(
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
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
}

class MyPostsCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'myPosts',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/my_posts/',
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

class CreatePostCall {
  Future<ApiCallResponse> call({
    List<String>? taskerLanguagesList,
    String? description = '',
    int? radiusOfWork,
    bool? isVerified,
    String? postOpenCloseStatus = '',
    String? skillLevel = '',
    String? startDate = '',
    String? startTime = '',
    String? customStartTime = '',
    String? endDatetime = '',
    bool? isPeriodic,
    int? numSessions,
    String? sessionDuration = '',
    bool? repeatDate,
    String? repeatType = '',
    String? repeatEvery = '',
    String? preferredDays = '',
    String? monthlyRepeatType = '',
    String? endDateType = '',
    int? session,
    int? poster,
    int? address,
    int? postStatus,
    int? relatedService,
    int? relatedServiceCategory,
    int? taskerAge,
    bool? identified,
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense = '',
    bool? travelCosts,
    String? payPerHour = '',
    bool? cancellationPenalty,
    String? payCancellationPerHour = '',
    String? cancellationBeforeAppointment = '',
    int? daysOfWeek,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final taskerLanguages = _serializeList(taskerLanguagesList);

    final body = '''
{
  "tasker_languages": [
    ${taskerLanguages}
  ],
  "description": "${description}",
  "radius_of_work": ${radiusOfWork},
  "is_verified": ${isVerified},
  "post_open_close_status": "${postOpenCloseStatus}",
  "skill_level": "${skillLevel}",
  "start_date": "${startDate}",
  "start_time": "${startTime}",
  "custom_start_time": "${customStartTime}",
  "end_datetime": "${endDatetime}",
  "is_periodic": ${isPeriodic},
  "days_of_week": ${daysOfWeek},
  "num_sessions": ${numSessions},
  "session_duration": "${sessionDuration}",
  "repeat_date": ${repeatDate},
  "repeat_type": "${repeatType}",
  "repeat_every": "${repeatEvery}",
  "preferred_days": "${preferredDays}",
  "monthly_repeat_type": "${monthlyRepeatType}",
  "end_date_type": "${endDateType}",
  "session": ${session},
  "tasker_age": ${taskerAge},
  "identified": ${identified},
  "years_of_experience": ${yearsOfExperience},
  "insurance": ${insurance},
  "driver_license": "${driverLicense}",
  "travel_costs": ${travelCosts},
  "pay_per_hour": "${payPerHour}",
  "cancellation_penalty": ${cancellationPenalty},
  "pay_cancellation_per_hour": "${payCancellationPerHour}",
  "cancellation_before_appointment": "${cancellationBeforeAppointment}",
  "poster": ${poster},
  "address": ${address},
  "post_status": ${postStatus},
  "related_service": ${relatedService},
  "related_service_category": ${relatedServiceCategory}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/',
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
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseState(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargianCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStatTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeatEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class UpdatePostCall {
  Future<ApiCallResponse> call({
    List<String>? taskerLanguagesList,
    String? description = '',
    int? radiusOfWork,
    bool? isVerified,
    String? postOpenCloseStatus = '',
    String? skillLevel = '',
    String? startDate = '',
    String? startTime = '',
    String? customStartTime = '',
    String? endDatetime = '',
    bool? isPeriodic,
    int? numSessions,
    String? sessionDuration = '',
    bool? repeatDate,
    String? repeatType = '',
    String? repeatEvery = '',
    List<String>? preferredDaysList,
    String? monthlyRepeatType = '',
    String? endDateType = '',
    int? session,
    int? poster,
    int? address,
    int? postStatus,
    int? relatedService,
    int? relatedServiceCategory,
    int? id,
    String? taskerAge = '',
    bool? identified,
    String? taskerGender = '',
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense = '',
    bool? travelCosts,
    String? payPerHour = '',
    bool? cancellationPenalty,
    String? payCancellationPerHour = '',
    String? cancellationBeforeAppointment = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final taskerLanguages = _serializeList(taskerLanguagesList);
    final preferredDays = _serializeList(preferredDaysList);

    final body = '''
{
  "tasker_languages": ${taskerLanguages},
  "description": "${description}",
  "radius_of_work": ${radiusOfWork},
  "is_verified": ${isVerified},
  "post_open_close_status": "${postOpenCloseStatus}",
  "skill_level": "${skillLevel}",
  "start_date": "${startDate}",
  "start_time": "${startTime}",
  "custom_start_time": "${customStartTime}",
  "end_datetime": "${endDatetime}",
  "is_periodic": ${isPeriodic},
  "num_sessions": ${numSessions},
  "session_duration": "${sessionDuration}",
  "repeat_date": "${repeatDate}",
  "repeat_type": "${repeatType}",
  "repeat_every": "${repeatEvery}",
  "days_of_week": ${preferredDays},
  "monthly_repeat_type": "${monthlyRepeatType}",
  "end_date_type": "${endDateType}",
  "session": ${session},
  "poster": ${poster},
  "address": ${address},
  "post_status": ${postStatus},
  "related_service": ${relatedService},
  "related_service_category": ${relatedServiceCategory},
  "tasker_age": "${taskerAge}",
  "identified": ${identified},
  "tasker_gender": "${taskerGender}",
  "years_of_experience": ${yearsOfExperience},
  "insurance": ${insurance},
  "driver_license": "${driverLicense}",
  "travel_costs": ${travelCosts},
  "pay_per_hour": "${payPerHour}",
  "cancellation_penalty": ${cancellationPenalty},
  "pay_cancellation_per_hour": "${payCancellationPerHour}",
  "cancellation_before_appointment": "${cancellationBeforeAppointment}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updatePost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
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
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseState(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargianCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStatTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeatEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class InitiatePostCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'initiatePost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/',
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
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseState(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargianCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStatTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeatEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class SinglePostReadCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'singlePostRead',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}',
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
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLangauges(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargainCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStartTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeaetEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class UserProfileListCall {
  Future<ApiCallResponse> call({
    String? userRole = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileList',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'user_role': userRole,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserProfileReadCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileRead',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/',
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

  dynamic appointment(dynamic response) => getJsonField(
        response,
        r'''$.my_appointments''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic userprofilevisibility(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_visibility''',
      );
  dynamic usertitle(dynamic response) => getJsonField(
        response,
        r'''$.user_title''',
      );
  dynamic userrole(dynamic response) => getJsonField(
        response,
        r'''$.user_role''',
      );
  dynamic driverlicense(dynamic response) => getJsonField(
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
  dynamic hasinsurance(dynamic response) => getJsonField(
        response,
        r'''$.has_insurance''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic userServices(dynamic response) => getJsonField(
        response,
        r'''$.user_services''',
        true,
      );
  dynamic userProfileEducations(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_educations''',
        true,
      );
  dynamic relateduseruserpermissions(dynamic response) => getJsonField(
        response,
        r'''$.related_user.user_permissions''',
        true,
      );
  dynamic userlanguages(dynamic response) => getJsonField(
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
  dynamic myreviews(dynamic response) => getJsonField(
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
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic family(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic reviewAverage(dynamic response) => getJsonField(
        response,
        r'''$.review_average''',
      );
  dynamic post(dynamic response) => getJsonField(
        response,
        r'''$.posts''',
        true,
      );
  dynamic myReviews(dynamic response) => getJsonField(
        response,
        r'''$.my_reviews''',
        true,
      );
  dynamic avatar(dynamic response) => getJsonField(
        response,
        r'''$.avatar''',
      );
}

class PostsCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'posts',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/',
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

class PostReadCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'postRead',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
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
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic posterid(dynamic response) => getJsonField(
        response,
        r'''$.poster.id''',
      );
  dynamic postercreatedat(dynamic response) => getJsonField(
        response,
        r'''$.poster.created_at''',
      );
  dynamic postermodifiedat(dynamic response) => getJsonField(
        response,
        r'''$.poster.modified_at''',
      );
  dynamic posteruserprofilevisibility(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_profile_visibility''',
      );
  dynamic posterusertitle(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_title''',
      );
  dynamic posteruserrole(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_role''',
      );
  dynamic posterdriverlicense(dynamic response) => getJsonField(
        response,
        r'''$.poster.driver_license''',
      );
  dynamic posteruserlanguages(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_languages''',
        true,
      );
  dynamic posterusercountry(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_country''',
      );
  dynamic posterissubscribed(dynamic response) => getJsonField(
        response,
        r'''$.poster.is_subscribed''',
      );
  dynamic posterisverified(dynamic response) => getJsonField(
        response,
        r'''$.poster.is_verified''',
      );
  dynamic posterhasinsurance(dynamic response) => getJsonField(
        response,
        r'''$.poster.has_insurance''',
      );
  dynamic posterreviewcount(dynamic response) => getJsonField(
        response,
        r'''$.poster.review_count''',
      );
  dynamic posteraccounttype(dynamic response) => getJsonField(
        response,
        r'''$.poster.account_type''',
      );
  dynamic taskerlanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedat(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic isverified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postopenclosestatus(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skilllevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
        true,
      );
  dynamic appointmentcount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargaincount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewcount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic starttime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic isperiodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic repeatdate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic enddatetype(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic identified(dynamic response) => getJsonField(
        response,
        r'''$.identified''',
      );
  dynamic insurance(dynamic response) => getJsonField(
        response,
        r'''$.insurance''',
      );
  dynamic travelcosts(dynamic response) => getJsonField(
        response,
        r'''$.travel_costs''',
      );
  dynamic cancellationpenalty(dynamic response) => getJsonField(
        response,
        r'''$.cancellation_penalty''',
      );
  dynamic poststatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.address.city''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.poster.first_name''',
      );
  dynamic family(dynamic response) => getJsonField(
        response,
        r'''$.poster.last_name''',
      );
}

class AppointmentListCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'appointmentList',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/appointment/',
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
        r'''$[:].id''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
      );
  dynamic modifiedat(dynamic response) => getJsonField(
        response,
        r'''$[:].modified_at''',
      );
  dynamic appointmentstatus(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_status''',
      );
  dynamic appointmenttime(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_time''',
      );
  dynamic appointmenttype(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_type''',
      );
  dynamic appointmentgoal(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_goal''',
      );
  dynamic appointmentlocationlat(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lat''',
      );
  dynamic appointmentlocationlng(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lng''',
      );
  dynamic reviewcount(dynamic response) => getJsonField(
        response,
        r'''$[:].review_count''',
      );
  dynamic interviewee(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee''',
      );
  dynamic interviewer(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewer''',
      );
  dynamic relatedpost(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post''',
      );
}

class AppointmentReadCall {
  Future<ApiCallResponse> call({
    int? id,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'appointmentRead',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/appointment/${id}/',
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

class CreateAppointmentCall {
  Future<ApiCallResponse> call({
    String? appointmentStatus = '',
    String? appointmentType = '',
    String? appointmentGoal = '',
    String? appointmentMeta = '',
    String? meetingLink = '',
    String? appointmentLocationLat = '',
    String? appointmentLocationLng = '',
    int? reviewCount,
    int? reviewAverage,
    bool? isIntervieweeAccepted,
    bool? isInterviewerAccepted,
    String? appointmentTime = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "appointment_status": "${appointmentStatus}",
  "appointment_type": "${appointmentType}",
  "appointment_goal": "${appointmentGoal}",
  "appointment_meta": "${appointmentMeta}",
  "meeting_link": "${meetingLink}",
  "appointment_location_lat": "${appointmentLocationLat}",
  "appointment_location_lng": "${appointmentLocationLng}",
  "review_count": ${reviewCount},
  "review_average": ${reviewAverage},
  "is_interviewer_accepted": ${isInterviewerAccepted},
  "is_interviewee_accepted": ${isIntervieweeAccepted},
  "appointment_time": "${appointmentTime}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create appointment',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/appointment/',
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

class AppointmentUpdateCall {
  Future<ApiCallResponse> call({
    String? appointmentStatus = '',
    String? appointmentType = '',
    String? appointmentGoal = '',
    String? appointmentMeta = '',
    String? meetingLink = '',
    String? appointmentLocationLat = '',
    String? appointmentLocationLng = '',
    int? reviewCount,
    int? reviewAverage,
    int? id,
    bool? isIntervieweeAccepted,
    bool? isInterviewerAccepted,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "appointment_status": "${appointmentStatus}",
  "appointment_type": "${appointmentType}",
  "appointment_goal": "${appointmentGoal}",
  "appointment_meta": "${appointmentMeta}",
  "meeting_link": "${meetingLink}",
  "appointment_location_lat": "${appointmentLocationLat}",
  "appointment_location_lng": "${appointmentLocationLng}",
  "review_count": ${reviewCount},
  "review_average": ${reviewAverage},
  "is_interviewer_accepted": ${isInterviewerAccepted},
  "is_interviewee_accepted": ${isIntervieweeAccepted}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'appointment Update',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/appointment/${id}/',
      callType: ApiCallType.PATCH,
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

class MyAppointmentCall {
  Future<ApiCallResponse> call({
    bool? isIntervieweeAccepted,
    bool? isInterviewerAccepted,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'My appointment',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/appointment/my_appointments/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'is_interviewee_accepted': isIntervieweeAccepted,
        'is_interviewer_accepted': isInterviewerAccepted,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic posterName(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.first_name''',
      );
  dynamic posterFamily(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.last_name''',
      );
  dynamic relatedPost(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post''',
        true,
      );
  dynamic relatedPostId(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.id''',
      );
  dynamic relatedpostposterrelateduser(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user''',
      );
  dynamic relatedpostposterrelateduserissuperuser(dynamic response) =>
      getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.is_superuser''',
      );
  dynamic relatedpostposterrelateduserusername(dynamic response) =>
      getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.username''',
      );
  dynamic posterEmailAddress(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.email''',
      );
  dynamic crateAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$[:].modified_at''',
        true,
      );
  dynamic appointmentStatus(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_status''',
        true,
      );
  dynamic appointmentTime(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_time''',
        true,
      );
  dynamic appointmentType(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_type''',
        true,
      );
  dynamic appointmentGoal(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_goal''',
        true,
      );
  dynamic appointmentMeta(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_meta''',
        true,
      );
  dynamic meetinglink(dynamic response) => getJsonField(
        response,
        r'''$[:].meeting_link''',
        true,
      );
  dynamic appointmentLat(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lat''',
        true,
      );
  dynamic appointmentLng(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lng''',
        true,
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$[:].review_count''',
        true,
      );
  dynamic reviewAverage(dynamic response) => getJsonField(
        response,
        r'''$[:].review_average''',
        true,
      );
  dynamic interVieweeName(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee.related_user.first_name''',
        true,
      );
  dynamic interVieweeFamily(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee.related_user.last_name''',
        true,
      );
  dynamic interVieweeEmailAddress(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee.related_user.email''',
        true,
      );
}

class MyBargainsCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'my bargains',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/bargain/my_bargains/',
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

class ServiceCategoryCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'serviceCategory',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/service-category/',
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

  dynamic icon(dynamic response) => getJsonField(
        response,
        r'''$[:].icon_url''',
        true,
      );
}

class MyBargainsPostCall {
  Future<ApiCallResponse> call({
    int? bargainee,
    int? bargainer,
    int? postId,
    int? appointmentId,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'My bargains post',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/bargain/my_bargains/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'bargainee': bargainee,
        'bargainer': bargainer,
        'post_id': postId,
        'appointment_id': appointmentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic postId(dynamic response) => getJsonField(
        response,
        r'''$[:].post_id''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  dynamic bargainer(dynamic response) => getJsonField(
        response,
        r'''$[:].bargainer''',
      );
  dynamic bargainee(dynamic response) => getJsonField(
        response,
        r'''$[:].bargainee''',
      );
}

class MyReviewsCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'My Reviews',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/my_reviews/',
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

class ReviewsAboutMeCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Reviews about me',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/user-profile/reviews_about_me/',
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

class SendVerifacationCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "to": "${to}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendVerifacation',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/verfiy/send/',
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

class CheckVerficationCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? code = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "to": "${to}",
  "code": "${code}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkVerfication',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/verify/check/',
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

class UpdateUserProfileCall {
  Future<ApiCallResponse> call({
    int? id,
    String? userTitle = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? dateOfBirth = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "user_title": "${userTitle}",
  "date_of_birth": "${dateOfBirth}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "phone_number": "${phoneNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update user profile',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/',
      callType: ApiCallType.PATCH,
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

class StripeCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? image = '',
    int? price,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "name": "string",
  "image": "string",
  "price": 0,
  "success_url": "string",
  "cancel_url": "string"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'stripe',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/stripe/create_checkout_session/',
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

class GetUserServicesCall {
  Future<ApiCallResponse> call({
    int? service,
    int? serviceCategory,
    int? userProfile,
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get user services',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-service/',
      callType: ApiCallType.GET,
      headers: {
        ...TaskerpageBackendGroup.headers,
      },
      params: {
        'service': service,
        'service_category': serviceCategory,
        'user_profile': userProfile,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EducationPartialUpdateCall {
  Future<ApiCallResponse> call({
    int? id,
    String? schoolTitle = '',
    String? title = '',
    String? certificateUrl = '',
    String? educationLevel = '',
    String? apiGlobalKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1MTE5NjIyLCJpYXQiOjE2OTI1Mjc2MjIsImp0aSI6IjM5NzIzMDhhNzE0MTRhZDA5OTgwMzY0NWY3NmUyODVkIiwidXNlcl9pZCI6MX0.N0a0DJNhmznV8bTW29MlgguD-MxKSvKmQgoEeZVz5XQ',
  }) {
    final body = '''
{
  "title": "${title}",
  "school_title": "${schoolTitle}",
  "certificate_url": "${certificateUrl}",
  "education_level": "${educationLevel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'educationPartialUpdate',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/education/${id}/',
      callType: ApiCallType.PATCH,
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
