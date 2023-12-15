// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomePageTaskerSugestionInputStruct extends BaseStruct {
  HomePageTaskerSugestionInputStruct({
    String? title,
    String? subtitle,
    List<CustomerProfileItemStruct>? customerProfiles,
    CardType? cardType,
  })  : _title = title,
        _subtitle = subtitle,
        _customerProfiles = customerProfiles,
        _cardType = cardType;

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

  // "customer_profiles" field.
  List<CustomerProfileItemStruct>? _customerProfiles;
  List<CustomerProfileItemStruct> get customerProfiles =>
      _customerProfiles ?? const [];
  set customerProfiles(List<CustomerProfileItemStruct>? val) =>
      _customerProfiles = val;
  void updateCustomerProfiles(
          Function(List<CustomerProfileItemStruct>) updateFn) =>
      updateFn(_customerProfiles ??= []);
  bool hasCustomerProfiles() => _customerProfiles != null;

  // "card_type" field.
  CardType? _cardType;
  CardType? get cardType => _cardType;
  set cardType(CardType? val) => _cardType = val;
  bool hasCardType() => _cardType != null;

  static HomePageTaskerSugestionInputStruct fromMap(
          Map<String, dynamic> data) =>
      HomePageTaskerSugestionInputStruct(
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        customerProfiles: getStructList(
          data['customer_profiles'],
          CustomerProfileItemStruct.fromMap,
        ),
        cardType: deserializeEnum<CardType>(data['card_type']),
      );

  static HomePageTaskerSugestionInputStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? HomePageTaskerSugestionInputStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'subtitle': _subtitle,
        'customer_profiles': _customerProfiles?.map((e) => e.toMap()).toList(),
        'card_type': _cardType?.toString(),
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
        'customer_profiles': serializeParam(
          _customerProfiles,
          ParamType.DataStruct,
          true,
        ),
        'card_type': serializeParam(
          _cardType,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static HomePageTaskerSugestionInputStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HomePageTaskerSugestionInputStruct(
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
        customerProfiles: deserializeStructParam<CustomerProfileItemStruct>(
          data['customer_profiles'],
          ParamType.DataStruct,
          true,
          structBuilder: CustomerProfileItemStruct.fromSerializableMap,
        ),
        cardType: deserializeParam<CardType>(
          data['card_type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'HomePageTaskerSugestionInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HomePageTaskerSugestionInputStruct &&
        title == other.title &&
        subtitle == other.subtitle &&
        listEquality.equals(customerProfiles, other.customerProfiles) &&
        cardType == other.cardType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, subtitle, customerProfiles, cardType]);
}

HomePageTaskerSugestionInputStruct createHomePageTaskerSugestionInputStruct({
  String? title,
  String? subtitle,
  CardType? cardType,
}) =>
    HomePageTaskerSugestionInputStruct(
      title: title,
      subtitle: subtitle,
      cardType: cardType,
    );
