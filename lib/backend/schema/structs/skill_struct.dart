// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillStruct extends BaseStruct {
  SkillStruct({
    String? skill,
  }) : _skill = skill;

  // "skill" field.
  String? _skill;
  String get skill => _skill ?? '';
  set skill(String? val) => _skill = val;
  bool hasSkill() => _skill != null;

  static SkillStruct fromMap(Map<String, dynamic> data) => SkillStruct(
        skill: data['skill'] as String?,
      );

  static SkillStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SkillStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skill': _skill,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill': serializeParam(
          _skill,
          ParamType.String,
        ),
      }.withoutNulls;

  static SkillStruct fromSerializableMap(Map<String, dynamic> data) =>
      SkillStruct(
        skill: deserializeParam(
          data['skill'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SkillStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SkillStruct && skill == other.skill;
  }

  @override
  int get hashCode => const ListEquality().hash([skill]);
}

SkillStruct createSkillStruct({
  String? skill,
}) =>
    SkillStruct(
      skill: skill,
    );
