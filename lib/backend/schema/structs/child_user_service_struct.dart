// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildUserServiceStruct extends BaseStruct {
  ChildUserServiceStruct({
    int? customerProfileSkillsName,
    String? skillCategoryName,
  })  : _customerProfileSkillsName = customerProfileSkillsName,
        _skillCategoryName = skillCategoryName;

  // "customer_profile_skills_name" field.
  int? _customerProfileSkillsName;
  int get customerProfileSkillsName => _customerProfileSkillsName ?? 0;
  set customerProfileSkillsName(int? val) => _customerProfileSkillsName = val;
  void incrementCustomerProfileSkillsName(int amount) =>
      _customerProfileSkillsName = customerProfileSkillsName + amount;
  bool hasCustomerProfileSkillsName() => _customerProfileSkillsName != null;

  // "skill_category_name" field.
  String? _skillCategoryName;
  String get skillCategoryName => _skillCategoryName ?? '';
  set skillCategoryName(String? val) => _skillCategoryName = val;
  bool hasSkillCategoryName() => _skillCategoryName != null;

  static ChildUserServiceStruct fromMap(Map<String, dynamic> data) =>
      ChildUserServiceStruct(
        customerProfileSkillsName:
            castToType<int>(data['customer_profile_skills_name']),
        skillCategoryName: data['skill_category_name'] as String?,
      );

  static ChildUserServiceStruct? maybeFromMap(dynamic data) => data is Map
      ? ChildUserServiceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customer_profile_skills_name': _customerProfileSkillsName,
        'skill_category_name': _skillCategoryName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_profile_skills_name': serializeParam(
          _customerProfileSkillsName,
          ParamType.int,
        ),
        'skill_category_name': serializeParam(
          _skillCategoryName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChildUserServiceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChildUserServiceStruct(
        customerProfileSkillsName: deserializeParam(
          data['customer_profile_skills_name'],
          ParamType.int,
          false,
        ),
        skillCategoryName: deserializeParam(
          data['skill_category_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChildUserServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChildUserServiceStruct &&
        customerProfileSkillsName == other.customerProfileSkillsName &&
        skillCategoryName == other.skillCategoryName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([customerProfileSkillsName, skillCategoryName]);
}

ChildUserServiceStruct createChildUserServiceStruct({
  int? customerProfileSkillsName,
  String? skillCategoryName,
}) =>
    ChildUserServiceStruct(
      customerProfileSkillsName: customerProfileSkillsName,
      skillCategoryName: skillCategoryName,
    );
