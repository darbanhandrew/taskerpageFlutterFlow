// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskItemStruct extends BaseStruct {
  TaskItemStruct({
    int? customerTask,
  }) : _customerTask = customerTask;

  // "customer_task" field.
  int? _customerTask;
  int get customerTask => _customerTask ?? 0;
  set customerTask(int? val) => _customerTask = val;
  void incrementCustomerTask(int amount) =>
      _customerTask = customerTask + amount;
  bool hasCustomerTask() => _customerTask != null;

  static TaskItemStruct fromMap(Map<String, dynamic> data) => TaskItemStruct(
        customerTask: castToType<int>(data['customer_task']),
      );

  static TaskItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'customer_task': _customerTask,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_task': serializeParam(
          _customerTask,
          ParamType.int,
        ),
      }.withoutNulls;

  static TaskItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskItemStruct(
        customerTask: deserializeParam(
          data['customer_task'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TaskItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskItemStruct && customerTask == other.customerTask;
  }

  @override
  int get hashCode => const ListEquality().hash([customerTask]);
}

TaskItemStruct createTaskItemStruct({
  int? customerTask,
}) =>
    TaskItemStruct(
      customerTask: customerTask,
    );
