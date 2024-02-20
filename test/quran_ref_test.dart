// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:guidance/guidance.dart';

void main() {
  test('Quran Ref Parse string', () {
    expect(QuranRef.parseString("1:1"), QuranRef.fromSurahAyath(1, 1));

    expect(QuranRef.parseString("1:8"), null);

    expect(QuranRef.parseString("-1:-1"), null);

    expect(QuranRef.parseString("115:100"), null);
  });

  test('Quran Ref toString()', () {
    expect(QuranRef.fromSurahAyath(1, 1)!.toString(), "1:1");

    expect(QuranRef.fromSurahAyath(2, 255)!.toString(), "2:255");
  });

  test('Quran Ref toInt()', () {
    expect(QuranRef.fromSurahAyath(1, 1)!.toInt(), 1001);

    expect(QuranRef.fromSurahAyath(114, 6)!.toInt(), 114006);
  });

  test('Quran Ref Parse int', () {
    expect(QuranRef.parseInt(1001), QuranRef.fromSurahAyath(1, 1));

    expect(QuranRef.parseInt(1008), null);

    expect(QuranRef.parseInt(-1001), null);

    expect(QuranRef.parseInt(115100), null);
  });

  test('Quran Ref Next', () {
    expect(QuranRef.fromSurahAyath(1, 1)!.next(), QuranRef.fromSurahAyath(1, 2)!);

    expect(QuranRef.fromSurahAyath(1, 7)!.next(), QuranRef.fromSurahAyath(2, 1)!);

    expect(QuranRef.fromSurahAyath(2, 286)!.next(), QuranRef.fromSurahAyath(3, 1)!);

    expect(QuranRef.fromSurahAyath(114, 6)!.next(), QuranRef.fromSurahAyath(1, 1)!);
  });

  test('Quran Ref Previous', () {
    expect(QuranRef.fromSurahAyath(1, 1)!.previous(), QuranRef.fromSurahAyath(114, 6)!);

    expect(QuranRef.fromSurahAyath(1, 7)!.previous(), QuranRef.fromSurahAyath(1, 6)!);

    expect(QuranRef.fromSurahAyath(2, 1)!.previous(), QuranRef.fromSurahAyath(1, 7)!);
  });
}
