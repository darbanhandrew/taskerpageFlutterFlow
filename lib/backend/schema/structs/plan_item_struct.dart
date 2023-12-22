// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanItemStruct extends BaseStruct {
  PlanItemStruct({
    String? plan,
  }) : _plan = plan;

  // "plan" field.
  String? _plan;
  String get plan => _plan ?? '';
  set plan(String? val) => _plan = val;
  bool hasPlan() => _plan != null;

  static PlanItemStruct fromMap(Map<String, dynamic> data) => PlanItemStruct(
        plan: data['plan'] as String?,
      );

  static PlanItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlanItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'plan': _plan,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'plan': serializeParam(
          _plan,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlanItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanItemStruct(
        plan: deserializeParam(
          data['plan'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlanItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanItemStruct && plan == other.plan;
  }

  @override
  int get hashCode => const ListEquality().hash([plan]);
}

PlanItemStruct createPlanItemStruct({
  String? plan,
}) =>
    PlanItemStruct(
      plan: plan,
    );
