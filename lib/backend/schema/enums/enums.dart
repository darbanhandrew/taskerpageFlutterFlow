import 'package:collection/collection.dart';

enum ColorMode {
  Dark,
  Light,
}

enum CardType {
  Small,
  Large,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ColorMode):
      return ColorMode.values.deserialize(value) as T?;
    case (CardType):
      return CardType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
