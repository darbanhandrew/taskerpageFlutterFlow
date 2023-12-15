// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SliderInputStruct extends BaseStruct {
  SliderInputStruct({
    String? backgroundImage,
    String? title,
    String? subtitle,
    String? buttonLink,
    String? butttonText,
  })  : _backgroundImage = backgroundImage,
        _title = title,
        _subtitle = subtitle,
        _buttonLink = buttonLink,
        _butttonText = butttonText;

  // "background_image" field.
  String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? '';
  set backgroundImage(String? val) => _backgroundImage = val;
  bool hasBackgroundImage() => _backgroundImage != null;

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

  // "button_link" field.
  String? _buttonLink;
  String get buttonLink => _buttonLink ?? '';
  set buttonLink(String? val) => _buttonLink = val;
  bool hasButtonLink() => _buttonLink != null;

  // "buttton_text" field.
  String? _butttonText;
  String get butttonText => _butttonText ?? '';
  set butttonText(String? val) => _butttonText = val;
  bool hasButttonText() => _butttonText != null;

  static SliderInputStruct fromMap(Map<String, dynamic> data) =>
      SliderInputStruct(
        backgroundImage: data['background_image'] as String?,
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        buttonLink: data['button_link'] as String?,
        butttonText: data['buttton_text'] as String?,
      );

  static SliderInputStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SliderInputStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'background_image': _backgroundImage,
        'title': _title,
        'subtitle': _subtitle,
        'button_link': _buttonLink,
        'buttton_text': _butttonText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'background_image': serializeParam(
          _backgroundImage,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'subtitle': serializeParam(
          _subtitle,
          ParamType.String,
        ),
        'button_link': serializeParam(
          _buttonLink,
          ParamType.String,
        ),
        'buttton_text': serializeParam(
          _butttonText,
          ParamType.String,
        ),
      }.withoutNulls;

  static SliderInputStruct fromSerializableMap(Map<String, dynamic> data) =>
      SliderInputStruct(
        backgroundImage: deserializeParam(
          data['background_image'],
          ParamType.String,
          false,
        ),
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
        buttonLink: deserializeParam(
          data['button_link'],
          ParamType.String,
          false,
        ),
        butttonText: deserializeParam(
          data['buttton_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SliderInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SliderInputStruct &&
        backgroundImage == other.backgroundImage &&
        title == other.title &&
        subtitle == other.subtitle &&
        buttonLink == other.buttonLink &&
        butttonText == other.butttonText;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([backgroundImage, title, subtitle, buttonLink, butttonText]);
}

SliderInputStruct createSliderInputStruct({
  String? backgroundImage,
  String? title,
  String? subtitle,
  String? buttonLink,
  String? butttonText,
}) =>
    SliderInputStruct(
      backgroundImage: backgroundImage,
      title: title,
      subtitle: subtitle,
      buttonLink: buttonLink,
      butttonText: butttonText,
    );
