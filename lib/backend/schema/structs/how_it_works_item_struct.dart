// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HowItWorksItemStruct extends BaseStruct {
  HowItWorksItemStruct({
    String? itemTitle,
    String? itemText,
    String? itemImage,
    int? itemOrderNumber,
    int? idx,
  })  : _itemTitle = itemTitle,
        _itemText = itemText,
        _itemImage = itemImage,
        _itemOrderNumber = itemOrderNumber,
        _idx = idx;

  // "item_title" field.
  String? _itemTitle;
  String get itemTitle => _itemTitle ?? '';
  set itemTitle(String? val) => _itemTitle = val;
  bool hasItemTitle() => _itemTitle != null;

  // "item_text" field.
  String? _itemText;
  String get itemText => _itemText ?? '';
  set itemText(String? val) => _itemText = val;
  bool hasItemText() => _itemText != null;

  // "item_image" field.
  String? _itemImage;
  String get itemImage => _itemImage ?? '';
  set itemImage(String? val) => _itemImage = val;
  bool hasItemImage() => _itemImage != null;

  // "item_order_number" field.
  int? _itemOrderNumber;
  int get itemOrderNumber => _itemOrderNumber ?? 0;
  set itemOrderNumber(int? val) => _itemOrderNumber = val;
  void incrementItemOrderNumber(int amount) =>
      _itemOrderNumber = itemOrderNumber + amount;
  bool hasItemOrderNumber() => _itemOrderNumber != null;

  // "idx" field.
  int? _idx;
  int get idx => _idx ?? 0;
  set idx(int? val) => _idx = val;
  void incrementIdx(int amount) => _idx = idx + amount;
  bool hasIdx() => _idx != null;

  static HowItWorksItemStruct fromMap(Map<String, dynamic> data) =>
      HowItWorksItemStruct(
        itemTitle: data['item_title'] as String?,
        itemText: data['item_text'] as String?,
        itemImage: data['item_image'] as String?,
        itemOrderNumber: castToType<int>(data['item_order_number']),
        idx: castToType<int>(data['idx']),
      );

  static HowItWorksItemStruct? maybeFromMap(dynamic data) => data is Map
      ? HowItWorksItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'item_title': _itemTitle,
        'item_text': _itemText,
        'item_image': _itemImage,
        'item_order_number': _itemOrderNumber,
        'idx': _idx,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'item_title': serializeParam(
          _itemTitle,
          ParamType.String,
        ),
        'item_text': serializeParam(
          _itemText,
          ParamType.String,
        ),
        'item_image': serializeParam(
          _itemImage,
          ParamType.String,
        ),
        'item_order_number': serializeParam(
          _itemOrderNumber,
          ParamType.int,
        ),
        'idx': serializeParam(
          _idx,
          ParamType.int,
        ),
      }.withoutNulls;

  static HowItWorksItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      HowItWorksItemStruct(
        itemTitle: deserializeParam(
          data['item_title'],
          ParamType.String,
          false,
        ),
        itemText: deserializeParam(
          data['item_text'],
          ParamType.String,
          false,
        ),
        itemImage: deserializeParam(
          data['item_image'],
          ParamType.String,
          false,
        ),
        itemOrderNumber: deserializeParam(
          data['item_order_number'],
          ParamType.int,
          false,
        ),
        idx: deserializeParam(
          data['idx'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HowItWorksItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HowItWorksItemStruct &&
        itemTitle == other.itemTitle &&
        itemText == other.itemText &&
        itemImage == other.itemImage &&
        itemOrderNumber == other.itemOrderNumber &&
        idx == other.idx;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([itemTitle, itemText, itemImage, itemOrderNumber, idx]);
}

HowItWorksItemStruct createHowItWorksItemStruct({
  String? itemTitle,
  String? itemText,
  String? itemImage,
  int? itemOrderNumber,
  int? idx,
}) =>
    HowItWorksItemStruct(
      itemTitle: itemTitle,
      itemText: itemText,
      itemImage: itemImage,
      itemOrderNumber: itemOrderNumber,
      idx: idx,
    );
