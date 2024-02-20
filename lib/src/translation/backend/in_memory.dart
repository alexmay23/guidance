// Dart imports:
import 'dart:typed_data';

// Project imports:
import 'package:guidance/src/translation/backend/backend.dart';

class InMemoryTranslationServiceBackend implements TranslationServiceBackend {
  final Map<String, Uint8List> _map = {};

  @override
  Future<Uint8List> getBytes(String key) async {
    return _map[key] ?? Uint8List(0);
  }

  @override
  Future<List<String>> getStoredKeys() async {
    return _map.keys.toList();
  }

  @override
  Future<void> removeBytesForKey(String key) async {
    _map.remove(key);
  }

  @override
  Future<void> storeBytes(Uint8List bytes, String key) async {
    _map[key] = bytes;
  }
}
