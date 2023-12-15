// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesCardInputStruct extends BaseStruct {
  CategoriesCardInputStruct({
    String? skillCategoryName,
    String? icon,
  })  : _skillCategoryName = skillCategoryName,
        _icon = icon;

  // "skill_category_name" field.
  String? _skillCategoryName;
  String get skillCategoryName => _skillCategoryName ?? '';
  set skillCategoryName(String? val) => _skillCategoryName = val;
  bool hasSkillCategoryName() => _skillCategoryName != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;
  bool hasIcon() => _icon != null;

  static CategoriesCardInputStruct fromMap(Map<String, dynamic> data) =>
      CategoriesCardInputStruct(
        skillCategoryName: data['skill_category_name'] as String?,
        icon: data['icon'] as String?,
      );

  static CategoriesCardInputStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CategoriesCardInputStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'skill_category_name': _skillCategoryName,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill_category_name': serializeParam(
          _skillCategoryName,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriesCardInputStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CategoriesCardInputStruct(
        skillCategoryName: deserializeParam(
          data['skill_category_name'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoriesCardInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriesCardInputStruct &&
        skillCategoryName == other.skillCategoryName &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([skillCategoryName, icon]);
}

CategoriesCardInputStruct createCategoriesCardInputStruct({
  String? skillCategoryName,
  String? icon,
}) =>
    CategoriesCardInputStruct(
      skillCategoryName: skillCategoryName,
      icon: icon,
    );
