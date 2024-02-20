// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:async_task/async_task.dart';

// Project imports:
import 'package:guidance/guidance.dart';

class DecodeQuranObjTask extends AsyncTask<Uint8List, QuranObj?> {
  final Uint8List bytes;

  DecodeQuranObjTask(this.bytes);

  @override
  Uint8List parameters() {
    return bytes;
  }

  @override
  FutureOr<QuranObj?> run() {
    if (bytes.isEmpty) return null;
    final json = jsonDecode(utf8.decode(bytes));
    if (json is! Map) return null;
    return QuranObj.from(Map<String, String>.from(json));
  }

  @override
  AsyncTask<Uint8List, QuranObj?> instantiate(Uint8List parameters,
      [Map<String, SharedData<dynamic, dynamic>>? sharedData]) {
    return DecodeQuranObjTask(parameters);
  }
}
