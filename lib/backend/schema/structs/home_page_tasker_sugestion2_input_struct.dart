// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomePageTaskerSugestion2InputStruct extends BaseStruct {
  HomePageTaskerSugestion2InputStruct({
    String? title,
    String? subTitle,
    List<String>? taskerList2,
  })  : _title = title,
        _subTitle = subTitle,
        _taskerList2 = taskerList2;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "sub_title" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  set subTitle(String? val) => _subTitle = val;
  bool hasSubTitle() => _subTitle != null;

  // "tasker_list2" field.
  List<String>? _taskerList2;
  List<String> get taskerList2 => _taskerList2 ?? const [];
  set taskerList2(List<String>? val) => _taskerList2 = val;
  void updateTaskerList2(Function(List<String>) updateFn) =>
      updateFn(_taskerList2 ??= []);
  bool hasTaskerList2() => _taskerList2 != null;

  static HomePageTaskerSugestion2InputStruct fromMap(
          Map<String, dynamic> data) =>
      HomePageTaskerSugestion2InputStruct(
        title: data['title'] as String?,
        subTitle: data['sub_title'] as String?,
        taskerList2: getDataList(data['tasker_list2']),
      );

  static HomePageTaskerSugestion2InputStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? HomePageTaskerSugestion2InputStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'sub_title': _subTitle,
        'tasker_list2': _taskerList2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'sub_title': serializeParam(
          _subTitle,
          ParamType.String,
        ),
        'tasker_list2': serializeParam(
          _taskerList2,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static HomePageTaskerSugestion2InputStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HomePageTaskerSugestion2InputStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        subTitle: deserializeParam(
          data['sub_title'],
          ParamType.String,
          false,
        ),
        taskerList2: deserializeParam<String>(
          data['tasker_list2'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'HomePageTaskerSugestion2InputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HomePageTaskerSugestion2InputStruct &&
        title == other.title &&
        subTitle == other.subTitle &&
        listEquality.equals(taskerList2, other.taskerList2);
  }

  @override
  int get hashCode => const ListEquality().hash([title, subTitle, taskerList2]);
}

HomePageTaskerSugestion2InputStruct createHomePageTaskerSugestion2InputStruct({
  String? title,
  String? subTitle,
}) =>
    HomePageTaskerSugestion2InputStruct(
      title: title,
      subTitle: subTitle,
    );
