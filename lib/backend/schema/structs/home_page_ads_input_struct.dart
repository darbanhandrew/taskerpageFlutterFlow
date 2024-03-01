// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomePageAdsInputStruct extends BaseStruct {
  HomePageAdsInputStruct({
    String? title,
    String? subtitle,
    String? buttonLink,
    String? buttonText,
    String? backgroundImage,
    ColorMode? colorMode,
  })  : _title = title,
        _subtitle = subtitle,
        _buttonLink = buttonLink,
        _buttonText = buttonText,
        _backgroundImage = backgroundImage,
        _colorMode = colorMode;

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

  // "button_text" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  set buttonText(String? val) => _buttonText = val;
  bool hasButtonText() => _buttonText != null;

  // "background_image" field.
  String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? '';
  set backgroundImage(String? val) => _backgroundImage = val;
  bool hasBackgroundImage() => _backgroundImage != null;

  // "color_mode" field.
  ColorMode? _colorMode;
  ColorMode? get colorMode => _colorMode;
  set colorMode(ColorMode? val) => _colorMode = val;
  bool hasColorMode() => _colorMode != null;

  static HomePageAdsInputStruct fromMap(Map<String, dynamic> data) =>
      HomePageAdsInputStruct(
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        buttonLink: data['button_link'] as String?,
        buttonText: data['button_text'] as String?,
        backgroundImage: data['background_image'] as String?,
        colorMode: deserializeEnum<ColorMode>(data['color_mode']),
      );

  static HomePageAdsInputStruct? maybeFromMap(dynamic data) => data is Map
      ? HomePageAdsInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'subtitle': _subtitle,
        'button_link': _buttonLink,
        'button_text': _buttonText,
        'background_image': _backgroundImage,
        'color_mode': _colorMode?.serialize(),
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
        'button_link': serializeParam(
          _buttonLink,
          ParamType.String,
        ),
        'button_text': serializeParam(
          _buttonText,
          ParamType.String,
        ),
        'background_image': serializeParam(
          _backgroundImage,
          ParamType.String,
        ),
        'color_mode': serializeParam(
          _colorMode,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static HomePageAdsInputStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HomePageAdsInputStruct(
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
        buttonText: deserializeParam(
          data['button_text'],
          ParamType.String,
          false,
        ),
        backgroundImage: deserializeParam(
          data['background_image'],
          ParamType.String,
          false,
        ),
        colorMode: deserializeParam<ColorMode>(
          data['color_mode'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'HomePageAdsInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HomePageAdsInputStruct &&
        title == other.title &&
        subtitle == other.subtitle &&
        buttonLink == other.buttonLink &&
        buttonText == other.buttonText &&
        backgroundImage == other.backgroundImage &&
        colorMode == other.colorMode;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [title, subtitle, buttonLink, buttonText, backgroundImage, colorMode]);
}

HomePageAdsInputStruct createHomePageAdsInputStruct({
  String? title,
  String? subtitle,
  String? buttonLink,
  String? buttonText,
  String? backgroundImage,
  ColorMode? colorMode,
}) =>
    HomePageAdsInputStruct(
      title: title,
      subtitle: subtitle,
      buttonLink: buttonLink,
      buttonText: buttonText,
      backgroundImage: backgroundImage,
      colorMode: colorMode,
    );
