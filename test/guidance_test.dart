// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:guidance/guidance.dart';

void miracleFromQuran() {
  final odds = <int>[];
  final evens = <int>[];
  for (final key in QuranSurahList.map.keys) {
    final sum = key + QuranSurahList.map[key]!.numberOfAyahs;
    if (sum % 2 == 0) {
      // четный
      evens.add(sum);
    } else {
      //нечетный
      odds.add(sum);
    }
  }
  final oddsSum = odds.reduce((value, element) => value + element);
  final evensSum = evens.reduce((value, element) => value + element);

  final totalAyaths = QuranSurahList.map.values.map((e) => e.numberOfAyahs).reduce((value, element) => value + element);
  final sumOfSurahs = QuranSurahList.map.keys.reduce((value, element) => value + element);
  if (kDebugMode) {
    print(
        "Odds len ${odds.length} Evens len ${evens.length} Evens sum: ($evensSum) Odds sum ($oddsSum)  Total $totalAyaths  Sum of surahs $sumOfSurahs");
  }
}

void main() {
  test('Quran Ref Parse string', () {
    miracleFromQuran();
  });
}
