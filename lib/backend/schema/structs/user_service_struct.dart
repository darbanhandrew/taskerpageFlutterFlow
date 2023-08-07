// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserServiceStruct extends BaseStruct {
  UserServiceStruct({
    String? serviceSkillLevel,
    int? serviceCategory,
    int? service,
    int? userProfile,
    int? id,
  })  : _serviceSkillLevel = serviceSkillLevel,
        _serviceCategory = serviceCategory,
        _service = service,
        _userProfile = userProfile,
        _id = id;

  // "service_skill_level" field.
  String? _serviceSkillLevel;
  String get serviceSkillLevel => _serviceSkillLevel ?? '';
  set serviceSkillLevel(String? val) => _serviceSkillLevel = val;
  bool hasServiceSkillLevel() => _serviceSkillLevel != null;

  // "service_category" field.
  int? _serviceCategory;
  int get serviceCategory => _serviceCategory ?? 0;
  set serviceCategory(int? val) => _serviceCategory = val;
  void incrementServiceCategory(int amount) =>
      _serviceCategory = serviceCategory + amount;
  bool hasServiceCategory() => _serviceCategory != null;

  // "service" field.
  int? _service;
  int get service => _service ?? 0;
  set service(int? val) => _service = val;
  void incrementService(int amount) => _service = service + amount;
  bool hasService() => _service != null;

  // "user_profile" field.
  int? _userProfile;
  int get userProfile => _userProfile ?? 0;
  set userProfile(int? val) => _userProfile = val;
  void incrementUserProfile(int amount) => _userProfile = userProfile + amount;
  bool hasUserProfile() => _userProfile != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  static UserServiceStruct fromMap(Map<String, dynamic> data) =>
      UserServiceStruct(
        serviceSkillLevel: data['service_skill_level'] as String?,
        serviceCategory: castToType<int>(data['service_category']),
        service: castToType<int>(data['service']),
        userProfile: castToType<int>(data['user_profile']),
        id: castToType<int>(data['id']),
      );

  static UserServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserServiceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'service_skill_level': _serviceSkillLevel,
        'service_category': _serviceCategory,
        'service': _service,
        'user_profile': _userProfile,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'service_skill_level': serializeParam(
          _serviceSkillLevel,
          ParamType.String,
        ),
        'service_category': serializeParam(
          _serviceCategory,
          ParamType.int,
        ),
        'service': serializeParam(
          _service,
          ParamType.int,
        ),
        'user_profile': serializeParam(
          _userProfile,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserServiceStruct(
        serviceSkillLevel: deserializeParam(
          data['service_skill_level'],
          ParamType.String,
          false,
        ),
        serviceCategory: deserializeParam(
          data['service_category'],
          ParamType.int,
          false,
        ),
        service: deserializeParam(
          data['service'],
          ParamType.int,
          false,
        ),
        userProfile: deserializeParam(
          data['user_profile'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserServiceStruct &&
        serviceSkillLevel == other.serviceSkillLevel &&
        serviceCategory == other.serviceCategory &&
        service == other.service &&
        userProfile == other.userProfile &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([serviceSkillLevel, serviceCategory, service, userProfile, id]);
}

UserServiceStruct createUserServiceStruct({
  String? serviceSkillLevel,
  int? serviceCategory,
  int? service,
  int? userProfile,
  int? id,
}) =>
    UserServiceStruct(
      serviceSkillLevel: serviceSkillLevel,
      serviceCategory: serviceCategory,
      service: service,
      userProfile: userProfile,
      id: id,
    );
