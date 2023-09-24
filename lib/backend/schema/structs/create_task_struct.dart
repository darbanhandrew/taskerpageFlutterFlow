// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateTaskStruct extends BaseStruct {
  CreateTaskStruct({
    String? skillCategory,
    TaskDeatelsStruct? taskDeatels,
    TaskAddressStruct? taskAddress,
    TaskScheduleStruct? taskSchedule,
    TaskerTypeStruct? taskerType,
  })  : _skillCategory = skillCategory,
        _taskDeatels = taskDeatels,
        _taskAddress = taskAddress,
        _taskSchedule = taskSchedule,
        _taskerType = taskerType;

  // "skill_category" field.
  String? _skillCategory;
  String get skillCategory => _skillCategory ?? '';
  set skillCategory(String? val) => _skillCategory = val;
  bool hasSkillCategory() => _skillCategory != null;

  // "taskDeatels" field.
  TaskDeatelsStruct? _taskDeatels;
  TaskDeatelsStruct get taskDeatels => _taskDeatels ?? TaskDeatelsStruct();
  set taskDeatels(TaskDeatelsStruct? val) => _taskDeatels = val;
  void updateTaskDeatels(Function(TaskDeatelsStruct) updateFn) =>
      updateFn(_taskDeatels ??= TaskDeatelsStruct());
  bool hasTaskDeatels() => _taskDeatels != null;

  // "taskAddress" field.
  TaskAddressStruct? _taskAddress;
  TaskAddressStruct get taskAddress => _taskAddress ?? TaskAddressStruct();
  set taskAddress(TaskAddressStruct? val) => _taskAddress = val;
  void updateTaskAddress(Function(TaskAddressStruct) updateFn) =>
      updateFn(_taskAddress ??= TaskAddressStruct());
  bool hasTaskAddress() => _taskAddress != null;

  // "taskSchedule" field.
  TaskScheduleStruct? _taskSchedule;
  TaskScheduleStruct get taskSchedule => _taskSchedule ?? TaskScheduleStruct();
  set taskSchedule(TaskScheduleStruct? val) => _taskSchedule = val;
  void updateTaskSchedule(Function(TaskScheduleStruct) updateFn) =>
      updateFn(_taskSchedule ??= TaskScheduleStruct());
  bool hasTaskSchedule() => _taskSchedule != null;

  // "taskerType" field.
  TaskerTypeStruct? _taskerType;
  TaskerTypeStruct get taskerType => _taskerType ?? TaskerTypeStruct();
  set taskerType(TaskerTypeStruct? val) => _taskerType = val;
  void updateTaskerType(Function(TaskerTypeStruct) updateFn) =>
      updateFn(_taskerType ??= TaskerTypeStruct());
  bool hasTaskerType() => _taskerType != null;

  static CreateTaskStruct fromMap(Map<String, dynamic> data) =>
      CreateTaskStruct(
        skillCategory: data['skill_category'] as String?,
        taskDeatels: TaskDeatelsStruct.maybeFromMap(data['taskDeatels']),
        taskAddress: TaskAddressStruct.maybeFromMap(data['taskAddress']),
        taskSchedule: TaskScheduleStruct.maybeFromMap(data['taskSchedule']),
        taskerType: TaskerTypeStruct.maybeFromMap(data['taskerType']),
      );

  static CreateTaskStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CreateTaskStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skill_category': _skillCategory,
        'taskDeatels': _taskDeatels?.toMap(),
        'taskAddress': _taskAddress?.toMap(),
        'taskSchedule': _taskSchedule?.toMap(),
        'taskerType': _taskerType?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill_category': serializeParam(
          _skillCategory,
          ParamType.String,
        ),
        'taskDeatels': serializeParam(
          _taskDeatels,
          ParamType.DataStruct,
        ),
        'taskAddress': serializeParam(
          _taskAddress,
          ParamType.DataStruct,
        ),
        'taskSchedule': serializeParam(
          _taskSchedule,
          ParamType.DataStruct,
        ),
        'taskerType': serializeParam(
          _taskerType,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CreateTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreateTaskStruct(
        skillCategory: deserializeParam(
          data['skill_category'],
          ParamType.String,
          false,
        ),
        taskDeatels: deserializeStructParam(
          data['taskDeatels'],
          ParamType.DataStruct,
          false,
          structBuilder: TaskDeatelsStruct.fromSerializableMap,
        ),
        taskAddress: deserializeStructParam(
          data['taskAddress'],
          ParamType.DataStruct,
          false,
          structBuilder: TaskAddressStruct.fromSerializableMap,
        ),
        taskSchedule: deserializeStructParam(
          data['taskSchedule'],
          ParamType.DataStruct,
          false,
          structBuilder: TaskScheduleStruct.fromSerializableMap,
        ),
        taskerType: deserializeStructParam(
          data['taskerType'],
          ParamType.DataStruct,
          false,
          structBuilder: TaskerTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CreateTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateTaskStruct &&
        skillCategory == other.skillCategory &&
        taskDeatels == other.taskDeatels &&
        taskAddress == other.taskAddress &&
        taskSchedule == other.taskSchedule &&
        taskerType == other.taskerType;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [skillCategory, taskDeatels, taskAddress, taskSchedule, taskerType]);
}

CreateTaskStruct createCreateTaskStruct({
  String? skillCategory,
  TaskDeatelsStruct? taskDeatels,
  TaskAddressStruct? taskAddress,
  TaskScheduleStruct? taskSchedule,
  TaskerTypeStruct? taskerType,
}) =>
    CreateTaskStruct(
      skillCategory: skillCategory,
      taskDeatels: taskDeatels ?? TaskDeatelsStruct(),
      taskAddress: taskAddress ?? TaskAddressStruct(),
      taskSchedule: taskSchedule ?? TaskScheduleStruct(),
      taskerType: taskerType ?? TaskerTypeStruct(),
    );
