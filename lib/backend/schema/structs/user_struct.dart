// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    List<UserServiceStruct>? customerProfileSkills,
  }) : _customerProfileSkills = customerProfileSkills;

  // "customerProfileSkills" field.
  List<UserServiceStruct>? _customerProfileSkills;
  List<UserServiceStruct> get customerProfileSkills =>
      _customerProfileSkills ?? const [];
  set customerProfileSkills(List<UserServiceStruct>? val) =>
      _customerProfileSkills = val;
  void updateCustomerProfileSkills(
          Function(List<UserServiceStruct>) updateFn) =>
      updateFn(_customerProfileSkills ??= []);
  bool hasCustomerProfileSkills() => _customerProfileSkills != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        customerProfileSkills: getStructList(
          data['customerProfileSkills'],
          UserServiceStruct.fromMap,
        ),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'customerProfileSkills':
            _customerProfileSkills?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customerProfileSkills': serializeParam(
          _customerProfileSkills,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        customerProfileSkills: deserializeStructParam<UserServiceStruct>(
          data['customerProfileSkills'],
          ParamType.DataStruct,
          true,
          structBuilder: UserServiceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        listEquality.equals(customerProfileSkills, other.customerProfileSkills);
  }

  @override
  int get hashCode => const ListEquality().hash([customerProfileSkills]);
}

UserStruct createUserStruct() => UserStruct();
