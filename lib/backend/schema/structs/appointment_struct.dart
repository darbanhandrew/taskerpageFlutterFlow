// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentStruct extends BaseStruct {
  AppointmentStruct({
    String? appointmentType,
    DateTime? date,
    String? time,
  })  : _appointmentType = appointmentType,
        _date = date,
        _time = time;

  // "AppointmentType" field.
  String? _appointmentType;
  String get appointmentType => _appointmentType ?? '';
  set appointmentType(String? val) => _appointmentType = val;
  bool hasAppointmentType() => _appointmentType != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "Time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  static AppointmentStruct fromMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        appointmentType: data['AppointmentType'] as String?,
        date: data['Date'] as DateTime?,
        time: data['Time'] as String?,
      );

  static AppointmentStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AppointmentStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'AppointmentType': _appointmentType,
        'Date': _date,
        'Time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AppointmentType': serializeParam(
          _appointmentType,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'Time': serializeParam(
          _time,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppointmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        appointmentType: deserializeParam(
          data['AppointmentType'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.DateTime,
          false,
        ),
        time: deserializeParam(
          data['Time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppointmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppointmentStruct &&
        appointmentType == other.appointmentType &&
        date == other.date &&
        time == other.time;
  }

  @override
  int get hashCode => const ListEquality().hash([appointmentType, date, time]);
}

AppointmentStruct createAppointmentStruct({
  String? appointmentType,
  DateTime? date,
  String? time,
}) =>
    AppointmentStruct(
      appointmentType: appointmentType,
      date: date,
      time: time,
    );
