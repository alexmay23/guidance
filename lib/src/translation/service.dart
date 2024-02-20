// Dart imports:
import 'dart:typed_data';

// Package imports:
import 'package:async_task/async_task.dart';

// Project imports:
import 'package:guidance/guidance.dart';

class TranslationService {
  final AsyncExecutor _executor;
  final TranslationServiceBackend _backend;
  final TranslationServiceFrontend _frontend;

  TranslationService(
    this._executor,
    this._backend,
    this._frontend,
  );

  static const _listKey = 'list';

  List<Translation>? _cache;

  Future<List<Translation>?> getListCache() async {
    if (_cache != null) {
      return _cache;
    }
    final cache = await _backend.getBytes(_listKey);
    final list = await decodeTranslationList(cache);
    if (list != null) {
      _cache = list;
    }
    return _cache;
  }

  Future<List<Translation>?> getList() async {
    final cache = await getListCache();
    if (cache != null) {
      return cache;
    }
    final result = await _frontend.getList();
    if (result != null) {
      final bytes = await _executor.execute(EncodeJsonTask(result.map((e) => e.toMap()).toList()));
      await _backend.storeBytes(bytes, _listKey);
    }
    return result;
  }

  Future<List<Translation>?> decodeTranslationList(Uint8List bytes) async {
    final decoded = await _executor.execute(DecodeJsonTask(bytes));
    if (decoded is! List) return null;
    return List.from(decoded).map((e) => Translation.fromMap(Map<String, dynamic>.from(e))).toList();
  }

  Future<QuranObj?> downloadTranslation(String identifier) async {
    final result = await _frontend.getTranslation(identifier);
    if (result != null) {
      final bytes = await _executor.execute(EncodeJsonTask(result.map));
      await _backend.storeBytes(bytes, identifier);
    }
    return result;
  }

  Future<QuranObj?> getTranslation(String identifier) async {
    final cache = await _backend.getBytes(identifier);
    final obj = await _executor.execute(DecodeQuranObjTask(cache));
    if (obj == null) {
      await _backend.removeBytesForKey(identifier);
    }
    return obj;
  }

  Future<List<String>> getCachedIdentifiers() async =>
      (await _backend.getStoredKeys()).where((element) => element == _listKey).toList();

  Future<void> remove(String id) => _backend.removeBytesForKey(id);
}
