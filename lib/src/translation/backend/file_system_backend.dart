// Dart imports:
import 'dart:io';
import 'dart:typed_data';

// Package imports:
import 'package:path/path.dart';

// Project imports:
import 'package:guidance/src/translation/backend/backend.dart';

class FileSystemTranslationServiceBackend implements TranslationServiceBackend {
  final String cacheFolderPath;
  final String format;

  FileSystemTranslationServiceBackend(this.cacheFolderPath, this.format);

  File fileFor(String identifier) => File(join(cacheFolderPath, "$identifier.$format"));

  @override
  Future<Uint8List> getBytes(String key) async {
    final file = fileFor(key);
    if (!await file.exists()) return Uint8List(0);
    return file.readAsBytes();
  }

  @override
  Future<void> removeBytesForKey(String key) async {
    final file = fileFor(key);
    if (!await file.exists()) return;
    await file.delete();
  }

  @override
  Future<void> storeBytes(Uint8List bytes, String key) async {
    final file = fileFor(key);
    await file.writeAsBytes(bytes);
  }

  @override
  Future<List<String>> getStoredKeys() async {
    final dir = Directory(cacheFolderPath);
    List<String> result = [];
    final list = dir.list();
    await for (final file in list) {
      final ext = extension(file.path);
      final name = basenameWithoutExtension(file.path);
      if (name.startsWith(".")) continue;
      if (ext != '.$format') continue;
      result.add(name);
    }
    return result;
  }
}
