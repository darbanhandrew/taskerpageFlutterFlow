// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillOptionsStruct extends BaseStruct {
  SkillOptionsStruct({
    String? name,
    String? type,
    String? values,
  })  : _name = name,
        _type = type,
        _values = values;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "values" field.
  String? _values;
  String get values => _values ?? '';
  set values(String? val) => _values = val;
  bool hasValues() => _values != null;

  static SkillOptionsStruct fromMap(Map<String, dynamic> data) =>
      SkillOptionsStruct(
        name: data['name'] as String?,
        type: data['type'] as String?,
        values: data['values'] as String?,
      );

  static SkillOptionsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SkillOptionsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'type': _type,
        'values': _values,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'values': serializeParam(
          _values,
          ParamType.String,
        ),
      }.withoutNulls;

  static SkillOptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SkillOptionsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        values: deserializeParam(
          data['values'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SkillOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SkillOptionsStruct &&
        name == other.name &&
        type == other.type &&
        values == other.values;
  }

  @override
  int get hashCode => const ListEquality().hash([name, type, values]);
}

SkillOptionsStruct createSkillOptionsStruct({
  String? name,
  String? type,
  String? values,
}) =>
    SkillOptionsStruct(
      name: name,
      type: type,
      values: values,
    );
