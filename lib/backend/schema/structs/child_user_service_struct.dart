// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildUserServiceStruct extends BaseStruct {
  ChildUserServiceStruct({
    String? skillCategoryName,
    String? customerProfileSkillsName,
  })  : _skillCategoryName = skillCategoryName,
        _customerProfileSkillsName = customerProfileSkillsName;

  // "skill_category_name" field.
  String? _skillCategoryName;
  String get skillCategoryName => _skillCategoryName ?? '';
  set skillCategoryName(String? val) => _skillCategoryName = val;
  bool hasSkillCategoryName() => _skillCategoryName != null;

  // "customer_profile_skills_name" field.
  String? _customerProfileSkillsName;
  String get customerProfileSkillsName => _customerProfileSkillsName ?? '';
  set customerProfileSkillsName(String? val) =>
      _customerProfileSkillsName = val;
  bool hasCustomerProfileSkillsName() => _customerProfileSkillsName != null;

  static ChildUserServiceStruct fromMap(Map<String, dynamic> data) =>
      ChildUserServiceStruct(
        skillCategoryName: data['skill_category_name'] as String?,
        customerProfileSkillsName:
            data['customer_profile_skills_name'] as String?,
      );

  static ChildUserServiceStruct? maybeFromMap(dynamic data) => data is Map
      ? ChildUserServiceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'skill_category_name': _skillCategoryName,
        'customer_profile_skills_name': _customerProfileSkillsName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill_category_name': serializeParam(
          _skillCategoryName,
          ParamType.String,
        ),
        'customer_profile_skills_name': serializeParam(
          _customerProfileSkillsName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChildUserServiceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChildUserServiceStruct(
        skillCategoryName: deserializeParam(
          data['skill_category_name'],
          ParamType.String,
          false,
        ),
        customerProfileSkillsName: deserializeParam(
          data['customer_profile_skills_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChildUserServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChildUserServiceStruct &&
        skillCategoryName == other.skillCategoryName &&
        customerProfileSkillsName == other.customerProfileSkillsName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([skillCategoryName, customerProfileSkillsName]);
}

ChildUserServiceStruct createChildUserServiceStruct({
  String? skillCategoryName,
  String? customerProfileSkillsName,
}) =>
    ChildUserServiceStruct(
      skillCategoryName: skillCategoryName,
      customerProfileSkillsName: customerProfileSkillsName,
    );
