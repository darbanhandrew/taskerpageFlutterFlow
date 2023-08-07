// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskCreationStruct extends BaseStruct {
  TaskCreationStruct({
    String? field,
  }) : _field = field;

  // "field" field.
  String? _field;
  String get field => _field ?? '';
  set field(String? val) => _field = val;
  bool hasField() => _field != null;

  static TaskCreationStruct fromMap(Map<String, dynamic> data) =>
      TaskCreationStruct(
        field: data['field'] as String?,
      );

  static TaskCreationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskCreationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'field': _field,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'field': serializeParam(
          _field,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskCreationStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskCreationStruct(
        field: deserializeParam(
          data['field'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskCreationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskCreationStruct && field == other.field;
  }

  @override
  int get hashCode => const ListEquality().hash([field]);
}

TaskCreationStruct createTaskCreationStruct({
  String? field,
}) =>
    TaskCreationStruct(
      field: field,
    );
