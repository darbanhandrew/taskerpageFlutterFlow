// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomePageTopSkillsInputStruct extends BaseStruct {
  HomePageTopSkillsInputStruct({
    String? title,
    List<String>? topSkills,
  })  : _title = title,
        _topSkills = topSkills;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "top_skills" field.
  List<String>? _topSkills;
  List<String> get topSkills => _topSkills ?? const [];
  set topSkills(List<String>? val) => _topSkills = val;
  void updateTopSkills(Function(List<String>) updateFn) =>
      updateFn(_topSkills ??= []);
  bool hasTopSkills() => _topSkills != null;

  static HomePageTopSkillsInputStruct fromMap(Map<String, dynamic> data) =>
      HomePageTopSkillsInputStruct(
        title: data['title'] as String?,
        topSkills: getDataList(data['top_skills']),
      );

  static HomePageTopSkillsInputStruct? maybeFromMap(dynamic data) => data is Map
      ? HomePageTopSkillsInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'top_skills': _topSkills,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'top_skills': serializeParam(
          _topSkills,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static HomePageTopSkillsInputStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HomePageTopSkillsInputStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        topSkills: deserializeParam<String>(
          data['top_skills'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'HomePageTopSkillsInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HomePageTopSkillsInputStruct &&
        title == other.title &&
        listEquality.equals(topSkills, other.topSkills);
  }

  @override
  int get hashCode => const ListEquality().hash([title, topSkills]);
}

HomePageTopSkillsInputStruct createHomePageTopSkillsInputStruct({
  String? title,
}) =>
    HomePageTopSkillsInputStruct(
      title: title,
    );
