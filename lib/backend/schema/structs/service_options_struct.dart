// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceOptionsStruct extends BaseStruct {
  ServiceOptionsStruct({
    String? field,
  }) : _field = field;

  // "field" field.
  String? _field;
  String get field => _field ?? '';
  set field(String? val) => _field = val;
  bool hasField() => _field != null;

  static ServiceOptionsStruct fromMap(Map<String, dynamic> data) =>
      ServiceOptionsStruct(
        field: data['field'] as String?,
      );

  static ServiceOptionsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ServiceOptionsStruct.fromMap(data) : null;

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

  static ServiceOptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceOptionsStruct(
        field: deserializeParam(
          data['field'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ServiceOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceOptionsStruct && field == other.field;
  }

  @override
  int get hashCode => const ListEquality().hash([field]);
}

ServiceOptionsStruct createServiceOptionsStruct({
  String? field,
}) =>
    ServiceOptionsStruct(
      field: field,
    );
