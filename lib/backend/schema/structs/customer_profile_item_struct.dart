// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerProfileItemStruct extends BaseStruct {
  CustomerProfileItemStruct({
    String? customerProfile,
  }) : _customerProfile = customerProfile;

  // "customer_profile" field.
  String? _customerProfile;
  String get customerProfile => _customerProfile ?? '';
  set customerProfile(String? val) => _customerProfile = val;
  bool hasCustomerProfile() => _customerProfile != null;

  static CustomerProfileItemStruct fromMap(Map<String, dynamic> data) =>
      CustomerProfileItemStruct(
        customerProfile: data['customer_profile'] as String?,
      );

  static CustomerProfileItemStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerProfileItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customer_profile': _customerProfile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_profile': serializeParam(
          _customerProfile,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerProfileItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CustomerProfileItemStruct(
        customerProfile: deserializeParam(
          data['customer_profile'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerProfileItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerProfileItemStruct &&
        customerProfile == other.customerProfile;
  }

  @override
  int get hashCode => const ListEquality().hash([customerProfile]);
}

CustomerProfileItemStruct createCustomerProfileItemStruct({
  String? customerProfile,
}) =>
    CustomerProfileItemStruct(
      customerProfile: customerProfile,
    );
