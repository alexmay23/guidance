// Dart imports:
import 'dart:typed_data';

abstract class TranslationServiceBackend {
  Future<void> storeBytes(Uint8List bytes, String key);
  Future<Uint8List> getBytes(String key);
  Future<void> removeBytesForKey(String key);
  Future<List<String>> getStoredKeys();
}
