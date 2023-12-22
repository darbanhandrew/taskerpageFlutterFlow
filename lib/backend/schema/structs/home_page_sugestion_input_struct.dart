// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomePageSugestionInputStruct extends BaseStruct {
  HomePageSugestionInputStruct({
    String? title,
    String? subtitle,
    List<TaskItemStruct>? customerTasks,
  })  : _title = title,
        _subtitle = subtitle,
        _customerTasks = customerTasks;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  set subtitle(String? val) => _subtitle = val;
  bool hasSubtitle() => _subtitle != null;

  // "customer_tasks" field.
  List<TaskItemStruct>? _customerTasks;
  List<TaskItemStruct> get customerTasks => _customerTasks ?? const [];
  set customerTasks(List<TaskItemStruct>? val) => _customerTasks = val;
  void updateCustomerTasks(Function(List<TaskItemStruct>) updateFn) =>
      updateFn(_customerTasks ??= []);
  bool hasCustomerTasks() => _customerTasks != null;

  static HomePageSugestionInputStruct fromMap(Map<String, dynamic> data) =>
      HomePageSugestionInputStruct(
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        customerTasks: getStructList(
          data['customer_tasks'],
          TaskItemStruct.fromMap,
        ),
      );

  static HomePageSugestionInputStruct? maybeFromMap(dynamic data) => data is Map
      ? HomePageSugestionInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'subtitle': _subtitle,
        'customer_tasks': _customerTasks?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'subtitle': serializeParam(
          _subtitle,
          ParamType.String,
        ),
        'customer_tasks': serializeParam(
          _customerTasks,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static HomePageSugestionInputStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HomePageSugestionInputStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        subtitle: deserializeParam(
          data['subtitle'],
          ParamType.String,
          false,
        ),
        customerTasks: deserializeStructParam<TaskItemStruct>(
          data['customer_tasks'],
          ParamType.DataStruct,
          true,
          structBuilder: TaskItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'HomePageSugestionInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HomePageSugestionInputStruct &&
        title == other.title &&
        subtitle == other.subtitle &&
        listEquality.equals(customerTasks, other.customerTasks);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, subtitle, customerTasks]);
}

HomePageSugestionInputStruct createHomePageSugestionInputStruct({
  String? title,
  String? subtitle,
}) =>
    HomePageSugestionInputStruct(
      title: title,
      subtitle: subtitle,
    );
