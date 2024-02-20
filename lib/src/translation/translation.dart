// Package imports:
import 'package:collection/collection.dart';

class Translation {
  final String id;
  final String name;
  final String language;
  final Map<String, dynamic> extra;

//<editor-fold desc="Data Methods">

  const Translation({
    required this.id,
    required this.name,
    required this.language,
    required this.extra,
  });

  static const _eq = DeepCollectionEquality();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Translation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          language == other.language &&
          _eq.equals(extra, other.extra));

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ language.hashCode ^ extra.hashCode;

  Translation copyWith({
    String? id,
    String? name,
    String? language,
    Map<String, dynamic>? extra,
  }) {
    return Translation(
      id: id ?? this.id,
      name: name ?? this.name,
      language: language ?? this.language,
      extra: extra ?? this.extra,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'language': language,
      'extra': extra,
    };
  }

  factory Translation.fromMap(Map<String, dynamic> map) {
    return Translation(
      id: map['id'] as String,
      name: map['name'] as String,
      language: map['language'] as String,
      extra: map['extra'] as Map<String, dynamic>,
    );
  }
}

abstract class TranslationConvertible {
  Translation asTranslation();
}
