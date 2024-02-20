// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:async_task/async_task.dart';

class DecodeJsonTask extends AsyncTask<Uint8List, dynamic> {
  DecodeJsonTask(this.bytes);

  final Uint8List bytes;

  @override
  Uint8List parameters() {
    return bytes;
  }

  @override
  FutureOr<dynamic> run() {
    if (bytes.isEmpty) return null;
    return jsonDecode(utf8.decode(bytes));
  }

  @override
  AsyncTask<Uint8List, dynamic> instantiate(Uint8List parameters,
      [Map<String, SharedData<dynamic, dynamic>>? sharedData]) {
    return DecodeJsonTask(parameters);
  }
}

class EncodeJsonTask extends AsyncTask<dynamic, Uint8List> {
  final dynamic object;

  EncodeJsonTask(this.object);

  @override
  dynamic parameters() {
    return object;
  }

  @override
  FutureOr<Uint8List> run() {
    return Uint8List.fromList(utf8.encode(jsonEncode(object)));
  }

  @override
  AsyncTask<dynamic, Uint8List> instantiate(parameters, [Map<String, SharedData<dynamic, dynamic>>? sharedData]) {
    return EncodeJsonTask(parameters);
  }
}
