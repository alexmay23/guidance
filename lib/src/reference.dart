// Project imports:
import 'package:guidance/guidance.dart';
import 'package:guidance/src/surah_list.dart';

class QuranRef {
  final int ayath;
  final int surah;

  QuranRef._({
    required this.surah,
    required this.ayath,
  });

  QuranRef.start()
      : surah = 1,
        ayath = 1;
  QuranRef.end()
      : surah = 114,
        ayath = 6;

  QuranRef next() {
    final idx = QuranSurahList.indices[toInt()]!;
    if (idx == 6235) {
      return QuranRef.start();
    }
    return QuranRef.parseInt(QuranSurahList.verses[idx + 1])!;
  }

  QuranRef previous() {
    final idx = QuranSurahList.indices[toInt()]!;
    if (idx == 0) {
      return QuranRef.end();
    }
    return QuranRef.parseInt(QuranSurahList.verses[idx - 1])!;
  }

  @override
  String toString() => "$surah:$ayath";

  static int intRepr(int surah, int ayath) => 1000 * surah + ayath;

  int toInt() => intRepr(surah, ayath);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is QuranRef && runtimeType == other.runtimeType && hashCode == other.hashCode;

  @override
  int get hashCode => toInt();

  static QuranRef? fromSurahAyath(int surah, int ayath) {
    if (surah < 1 || surah > 114) {
      return null;
    }
    final count = QuranSurahList.map[surah]!.numberOfAyahs;
    if (ayath < 1 || ayath > count) {
      return null;
    }
    return QuranRef._(surah: surah, ayath: ayath);
  }

  static QuranRef? parseInt(int intRepr) => fromSurahAyath(intRepr ~/ 1000, intRepr % 1000);

  static QuranRef? parseString(String? string) {
    if (string == null) return null;
    final split = string.split(":");
    if (split.length != 2) {
      return null;
    }
    final surah = int.tryParse(split[0]);
    if (surah == null) {
      return null;
    }
    final ayath = int.tryParse(split[1]);
    if (ayath == null) {
      return null;
    }
    return fromSurahAyath(surah, ayath);
  }
}
