// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SignUpRateStruct extends BaseStruct {
  SignUpRateStruct({
    String? type,
    int? howMuch,
    String? currency,
  })  : _type = type,
        _howMuch = howMuch,
        _currency = currency;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "how_much" field.
  int? _howMuch;
  int get howMuch => _howMuch ?? 0;
  set howMuch(int? val) => _howMuch = val;
  void incrementHowMuch(int amount) => _howMuch = howMuch + amount;
  bool hasHowMuch() => _howMuch != null;

  // "Currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;
  bool hasCurrency() => _currency != null;

  static SignUpRateStruct fromMap(Map<String, dynamic> data) =>
      SignUpRateStruct(
        type: data['type'] as String?,
        howMuch: castToType<int>(data['how_much']),
        currency: data['Currency'] as String?,
      );

  static SignUpRateStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SignUpRateStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'how_much': _howMuch,
        'Currency': _currency,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'how_much': serializeParam(
          _howMuch,
          ParamType.int,
        ),
        'Currency': serializeParam(
          _currency,
          ParamType.String,
        ),
      }.withoutNulls;

  static SignUpRateStruct fromSerializableMap(Map<String, dynamic> data) =>
      SignUpRateStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        howMuch: deserializeParam(
          data['how_much'],
          ParamType.int,
          false,
        ),
        currency: deserializeParam(
          data['Currency'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SignUpRateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SignUpRateStruct &&
        type == other.type &&
        howMuch == other.howMuch &&
        currency == other.currency;
  }

  @override
  int get hashCode => const ListEquality().hash([type, howMuch, currency]);
}

SignUpRateStruct createSignUpRateStruct({
  String? type,
  int? howMuch,
  String? currency,
}) =>
    SignUpRateStruct(
      type: type,
      howMuch: howMuch,
      currency: currency,
    );
