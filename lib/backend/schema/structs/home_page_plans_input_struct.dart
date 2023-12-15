// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomePagePlansInputStruct extends BaseStruct {
  HomePagePlansInputStruct({
    String? title,
    String? subtitle,
    List<PlanItemStruct>? plans,
  })  : _title = title,
        _subtitle = subtitle,
        _plans = plans;

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

  // "plans" field.
  List<PlanItemStruct>? _plans;
  List<PlanItemStruct> get plans => _plans ?? const [];
  set plans(List<PlanItemStruct>? val) => _plans = val;
  void updatePlans(Function(List<PlanItemStruct>) updateFn) =>
      updateFn(_plans ??= []);
  bool hasPlans() => _plans != null;

  static HomePagePlansInputStruct fromMap(Map<String, dynamic> data) =>
      HomePagePlansInputStruct(
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        plans: getStructList(
          data['plans'],
          PlanItemStruct.fromMap,
        ),
      );

  static HomePagePlansInputStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? HomePagePlansInputStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'subtitle': _subtitle,
        'plans': _plans?.map((e) => e.toMap()).toList(),
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
        'plans': serializeParam(
          _plans,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static HomePagePlansInputStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HomePagePlansInputStruct(
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
        plans: deserializeStructParam<PlanItemStruct>(
          data['plans'],
          ParamType.DataStruct,
          true,
          structBuilder: PlanItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'HomePagePlansInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HomePagePlansInputStruct &&
        title == other.title &&
        subtitle == other.subtitle &&
        listEquality.equals(plans, other.plans);
  }

  @override
  int get hashCode => const ListEquality().hash([title, subtitle, plans]);
}

HomePagePlansInputStruct createHomePagePlansInputStruct({
  String? title,
  String? subtitle,
}) =>
    HomePagePlansInputStruct(
      title: title,
      subtitle: subtitle,
    );
