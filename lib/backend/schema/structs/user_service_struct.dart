// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserServiceStruct extends BaseStruct {
  UserServiceStruct({
    String? serviceSkillLevel,
    String? serviceCategory,
    List<String>? service,
    SkillOptionsStruct? serviceOptions,
    String? id,
    String? skill,
    List<SkillStruct>? skills,
  })  : _serviceSkillLevel = serviceSkillLevel,
        _serviceCategory = serviceCategory,
        _service = service,
        _serviceOptions = serviceOptions,
        _id = id,
        _skill = skill,
        _skills = skills;

  // "service_skill_level" field.
  String? _serviceSkillLevel;
  String get serviceSkillLevel => _serviceSkillLevel ?? '';
  set serviceSkillLevel(String? val) => _serviceSkillLevel = val;
  bool hasServiceSkillLevel() => _serviceSkillLevel != null;

  // "serviceCategory" field.
  String? _serviceCategory;
  String get serviceCategory => _serviceCategory ?? '';
  set serviceCategory(String? val) => _serviceCategory = val;
  bool hasServiceCategory() => _serviceCategory != null;

  // "service" field.
  List<String>? _service;
  List<String> get service => _service ?? const [];
  set service(List<String>? val) => _service = val;
  void updateService(Function(List<String>) updateFn) =>
      updateFn(_service ??= []);
  bool hasService() => _service != null;

  // "serviceOptions" field.
  SkillOptionsStruct? _serviceOptions;
  SkillOptionsStruct get serviceOptions =>
      _serviceOptions ?? SkillOptionsStruct();
  set serviceOptions(SkillOptionsStruct? val) => _serviceOptions = val;
  void updateServiceOptions(Function(SkillOptionsStruct) updateFn) =>
      updateFn(_serviceOptions ??= SkillOptionsStruct());
  bool hasServiceOptions() => _serviceOptions != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "skill" field.
  String? _skill;
  String get skill => _skill ?? '';
  set skill(String? val) => _skill = val;
  bool hasSkill() => _skill != null;

  // "Skills" field.
  List<SkillStruct>? _skills;
  List<SkillStruct> get skills => _skills ?? const [];
  set skills(List<SkillStruct>? val) => _skills = val;
  void updateSkills(Function(List<SkillStruct>) updateFn) =>
      updateFn(_skills ??= []);
  bool hasSkills() => _skills != null;

  static UserServiceStruct fromMap(Map<String, dynamic> data) =>
      UserServiceStruct(
        serviceSkillLevel: data['service_skill_level'] as String?,
        serviceCategory: data['serviceCategory'] as String?,
        service: getDataList(data['service']),
        serviceOptions: SkillOptionsStruct.maybeFromMap(data['serviceOptions']),
        id: data['id'] as String?,
        skill: data['skill'] as String?,
        skills: getStructList(
          data['Skills'],
          SkillStruct.fromMap,
        ),
      );

  static UserServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserServiceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'service_skill_level': _serviceSkillLevel,
        'serviceCategory': _serviceCategory,
        'service': _service,
        'serviceOptions': _serviceOptions?.toMap(),
        'id': _id,
        'skill': _skill,
        'Skills': _skills?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'service_skill_level': serializeParam(
          _serviceSkillLevel,
          ParamType.String,
        ),
        'serviceCategory': serializeParam(
          _serviceCategory,
          ParamType.String,
        ),
        'service': serializeParam(
          _service,
          ParamType.String,
          true,
        ),
        'serviceOptions': serializeParam(
          _serviceOptions,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'skill': serializeParam(
          _skill,
          ParamType.String,
        ),
        'Skills': serializeParam(
          _skills,
          ParamType.DataStruct,
          true,
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
          data['serviceCategory'],
          ParamType.String,
          false,
        ),
        service: deserializeParam<String>(
          data['service'],
          ParamType.String,
          true,
        ),
        serviceOptions: deserializeStructParam(
          data['serviceOptions'],
          ParamType.DataStruct,
          false,
          structBuilder: SkillOptionsStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        skill: deserializeParam(
          data['skill'],
          ParamType.String,
          false,
        ),
        skills: deserializeStructParam<SkillStruct>(
          data['Skills'],
          ParamType.DataStruct,
          true,
          structBuilder: SkillStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserServiceStruct &&
        serviceSkillLevel == other.serviceSkillLevel &&
        serviceCategory == other.serviceCategory &&
        listEquality.equals(service, other.service) &&
        serviceOptions == other.serviceOptions &&
        id == other.id &&
        skill == other.skill &&
        listEquality.equals(skills, other.skills);
  }

  @override
  int get hashCode => const ListEquality().hash([
        serviceSkillLevel,
        serviceCategory,
        service,
        serviceOptions,
        id,
        skill,
        skills
      ]);
}

UserServiceStruct createUserServiceStruct({
  String? serviceSkillLevel,
  String? serviceCategory,
  SkillOptionsStruct? serviceOptions,
  String? id,
  String? skill,
}) =>
    UserServiceStruct(
      serviceSkillLevel: serviceSkillLevel,
      serviceCategory: serviceCategory,
      serviceOptions: serviceOptions ?? SkillOptionsStruct(),
      id: id,
      skill: skill,
    );
