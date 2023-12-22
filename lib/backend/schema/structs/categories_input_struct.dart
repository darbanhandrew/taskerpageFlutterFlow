// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesInputStruct extends BaseStruct {
  CategoriesInputStruct({
    String? title,
    List<CategoriesCardInputStruct>? selectedCategories,
  })  : _title = title,
        _selectedCategories = selectedCategories;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "selected_categories" field.
  List<CategoriesCardInputStruct>? _selectedCategories;
  List<CategoriesCardInputStruct> get selectedCategories =>
      _selectedCategories ?? const [];
  set selectedCategories(List<CategoriesCardInputStruct>? val) =>
      _selectedCategories = val;
  void updateSelectedCategories(
          Function(List<CategoriesCardInputStruct>) updateFn) =>
      updateFn(_selectedCategories ??= []);
  bool hasSelectedCategories() => _selectedCategories != null;

  static CategoriesInputStruct fromMap(Map<String, dynamic> data) =>
      CategoriesInputStruct(
        title: data['title'] as String?,
        selectedCategories: getStructList(
          data['selected_categories'],
          CategoriesCardInputStruct.fromMap,
        ),
      );

  static CategoriesInputStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'selected_categories':
            _selectedCategories?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'selected_categories': serializeParam(
          _selectedCategories,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CategoriesInputStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriesInputStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        selectedCategories: deserializeStructParam<CategoriesCardInputStruct>(
          data['selected_categories'],
          ParamType.DataStruct,
          true,
          structBuilder: CategoriesCardInputStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CategoriesInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CategoriesInputStruct &&
        title == other.title &&
        listEquality.equals(selectedCategories, other.selectedCategories);
  }

  @override
  int get hashCode => const ListEquality().hash([title, selectedCategories]);
}

CategoriesInputStruct createCategoriesInputStruct({
  String? title,
}) =>
    CategoriesInputStruct(
      title: title,
    );
