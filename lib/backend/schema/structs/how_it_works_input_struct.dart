// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HowItWorksInputStruct extends BaseStruct {
  HowItWorksInputStruct({
    String? title,
    List<HowItWorksItemStruct>? featuredItems,
  })  : _title = title,
        _featuredItems = featuredItems;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "featured_items" field.
  List<HowItWorksItemStruct>? _featuredItems;
  List<HowItWorksItemStruct> get featuredItems => _featuredItems ?? const [];
  set featuredItems(List<HowItWorksItemStruct>? val) => _featuredItems = val;
  void updateFeaturedItems(Function(List<HowItWorksItemStruct>) updateFn) =>
      updateFn(_featuredItems ??= []);
  bool hasFeaturedItems() => _featuredItems != null;

  static HowItWorksInputStruct fromMap(Map<String, dynamic> data) =>
      HowItWorksInputStruct(
        title: data['title'] as String?,
        featuredItems: getStructList(
          data['featured_items'],
          HowItWorksItemStruct.fromMap,
        ),
      );

  static HowItWorksInputStruct? maybeFromMap(dynamic data) => data is Map
      ? HowItWorksInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'featured_items': _featuredItems?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'featured_items': serializeParam(
          _featuredItems,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static HowItWorksInputStruct fromSerializableMap(Map<String, dynamic> data) =>
      HowItWorksInputStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        featuredItems: deserializeStructParam<HowItWorksItemStruct>(
          data['featured_items'],
          ParamType.DataStruct,
          true,
          structBuilder: HowItWorksItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'HowItWorksInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HowItWorksInputStruct &&
        title == other.title &&
        listEquality.equals(featuredItems, other.featuredItems);
  }

  @override
  int get hashCode => const ListEquality().hash([title, featuredItems]);
}

HowItWorksInputStruct createHowItWorksInputStruct({
  String? title,
}) =>
    HowItWorksInputStruct(
      title: title,
    );
