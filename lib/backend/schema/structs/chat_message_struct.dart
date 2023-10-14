// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends BaseStruct {
  ChatMessageStruct({
    String? content,
    DateTime? date,
    String? sender,
  })  : _content = content,
        _date = date,
        _sender = sender;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  set sender(String? val) => _sender = val;
  bool hasSender() => _sender != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        content: data['content'] as String?,
        date: data['date'] as DateTime?,
        sender: data['sender'] as String?,
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatMessageStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'date': _date,
        'sender': _sender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'sender': serializeParam(
          _sender,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        sender: deserializeParam(
          data['sender'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStruct &&
        content == other.content &&
        date == other.date &&
        sender == other.sender;
  }

  @override
  int get hashCode => const ListEquality().hash([content, date, sender]);
}

ChatMessageStruct createChatMessageStruct({
  String? content,
  DateTime? date,
  String? sender,
}) =>
    ChatMessageStruct(
      content: content,
      date: date,
      sender: sender,
    );
