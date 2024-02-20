import 'dart:collection';

import 'package:guidance/src/reference.dart';

class Surah {
  final String name;
  final int numberOfAyahs;

  Surah({
    required this.name,
    required this.numberOfAyahs,
  });
}

class QuranSurahList {
  static final map = {
    1: Surah(name: "ٱلْفَاتِحَةِ", numberOfAyahs: 7),
    2: Surah(name: "البَقَرَةِ", numberOfAyahs: 286),
    3: Surah(name: "آلِ عِمۡرَانَ", numberOfAyahs: 200),
    4: Surah(name: "النِّسَاءِ", numberOfAyahs: 176),
    5: Surah(name: "المَائـِدَةِ", numberOfAyahs: 120),
    6: Surah(name: "الأَنۡعَامِ", numberOfAyahs: 165),
    7: Surah(name: "الأَعۡرَافِ", numberOfAyahs: 206),
    8: Surah(name: "الأَنفَالِ", numberOfAyahs: 75),
    9: Surah(name: "التَّوۡبَةِ", numberOfAyahs: 129),
    10: Surah(name: "يُونُسَ", numberOfAyahs: 109),
    11: Surah(name: "هُودٍ", numberOfAyahs: 123),
    12: Surah(name: "يُوسُفَ", numberOfAyahs: 111),
    13: Surah(name: "الرَّعۡدِ", numberOfAyahs: 43),
    14: Surah(name: "إِبۡرَاهِيمَ", numberOfAyahs: 52),
    15: Surah(name: "الحِجۡرِ", numberOfAyahs: 99),
    16: Surah(name: "النَّحۡلِ", numberOfAyahs: 128),
    17: Surah(name: "الإِسۡرَاءِ", numberOfAyahs: 111),
    18: Surah(name: "الكَهۡفِ", numberOfAyahs: 110),
    19: Surah(name: "مَرۡيَمَ", numberOfAyahs: 98),
    20: Surah(name: "طه", numberOfAyahs: 135),
    21: Surah(name: "الأَنبِيَاءِ", numberOfAyahs: 112),
    22: Surah(name: "الحَجِّ", numberOfAyahs: 78),
    23: Surah(name: "المُؤۡمِنُونَ", numberOfAyahs: 118),
    24: Surah(name: "النُّورِ", numberOfAyahs: 64),
    25: Surah(name: "الفُرۡقَانِ", numberOfAyahs: 77),
    26: Surah(name: "الشُّعَرَاءِ", numberOfAyahs: 227),
    27: Surah(name: "النَّمۡلِ", numberOfAyahs: 93),
    28: Surah(name: "القَصَصِ", numberOfAyahs: 88),
    29: Surah(name: "العَنكَبُوتِ", numberOfAyahs: 69),
    30: Surah(name: "الرُّومِ", numberOfAyahs: 60),
    31: Surah(name: "لُقۡمَانَ", numberOfAyahs: 34),
    32: Surah(name: "السَّجۡدَةِ", numberOfAyahs: 30),
    33: Surah(name: "الأَحۡزَابِ", numberOfAyahs: 73),
    34: Surah(name: "سَبَإٍ", numberOfAyahs: 54),
    35: Surah(name: "فَاطِرٍ", numberOfAyahs: 45),
    36: Surah(name: "يسٓ", numberOfAyahs: 83),
    37: Surah(name: "الصَّافَّاتِ", numberOfAyahs: 182),
    38: Surah(name: "صٓ", numberOfAyahs: 88),
    39: Surah(name: "الزُّمَرِ", numberOfAyahs: 75),
    40: Surah(name: "غَافِرٍ", numberOfAyahs: 85),
    41: Surah(name: "فُصِّلَتۡ", numberOfAyahs: 54),
    42: Surah(name: "الشُّورَىٰ", numberOfAyahs: 53),
    43: Surah(name: "الزُّخۡرُفِ", numberOfAyahs: 89),
    44: Surah(name: "الدُّخَانِ", numberOfAyahs: 59),
    45: Surah(name: "الجَاثِيَةِ", numberOfAyahs: 37),
    46: Surah(name: "الأَحۡقَافِ", numberOfAyahs: 35),
    47: Surah(name: "مُحَمَّدٍ", numberOfAyahs: 38),
    48: Surah(name: "الفَتۡحِ", numberOfAyahs: 29),
    49: Surah(name: "الحُجُرَاتِ", numberOfAyahs: 18),
    50: Surah(name: "قٓ", numberOfAyahs: 45),
    51: Surah(name: "الذَّارِيَاتِ", numberOfAyahs: 60),
    52: Surah(name: "الطُّورِ", numberOfAyahs: 49),
    53: Surah(name: "النَّجۡمِ", numberOfAyahs: 62),
    54: Surah(name: "القَمَرِ", numberOfAyahs: 55),
    55: Surah(name: "الرَّحۡمَٰن", numberOfAyahs: 78),
    56: Surah(name: "الوَاقِعَةِ", numberOfAyahs: 96),
    57: Surah(name: "الحَدِيدِ", numberOfAyahs: 29),
    58: Surah(name: "المُجَادلَةِ", numberOfAyahs: 22),
    59: Surah(name: "الحَشۡرِ", numberOfAyahs: 24),
    60: Surah(name: "المُمۡتَحنَةِ", numberOfAyahs: 13),
    61: Surah(name: "الصَّفِّ", numberOfAyahs: 14),
    62: Surah(name: "الجُمُعَةِ", numberOfAyahs: 11),
    63: Surah(name: "المُنَافِقُونَ", numberOfAyahs: 11),
    64: Surah(name: "التَّغَابُنِ", numberOfAyahs: 18),
    65: Surah(name: "الطَّلَاقِ", numberOfAyahs: 12),
    66: Surah(name: "التَّحۡرِيمِ", numberOfAyahs: 12),
    67: Surah(name: "المُلۡكِ", numberOfAyahs: 30),
    68: Surah(name: "القَلَمِ", numberOfAyahs: 52),
    69: Surah(name: "الحَاقَّةِ", numberOfAyahs: 52),
    70: Surah(name: "المَعَارِجِ", numberOfAyahs: 44),
    71: Surah(name: "نُوحٍ", numberOfAyahs: 28),
    72: Surah(name: "الجِنِّ", numberOfAyahs: 28),
    73: Surah(name: "المُزَّمِّلِ", numberOfAyahs: 20),
    74: Surah(name: "المُدَّثِّرِ", numberOfAyahs: 56),
    75: Surah(name: "القِيَامَةِ", numberOfAyahs: 40),
    76: Surah(name: "الإِنسَانِ", numberOfAyahs: 31),
    77: Surah(name: "المُرۡسَلَاتِ", numberOfAyahs: 50),
    78: Surah(name: "النَّبَإِ", numberOfAyahs: 40),
    79: Surah(name: "النَّازِعَاتِ", numberOfAyahs: 46),
    80: Surah(name: "عَبَسَ", numberOfAyahs: 42),
    81: Surah(name: "التَّكۡوِيرِ", numberOfAyahs: 29),
    82: Surah(name: "الانفِطَارِ", numberOfAyahs: 19),
    83: Surah(name: "المُطَفِّفِينَ", numberOfAyahs: 36),
    84: Surah(name: "الانشِقَاقِ", numberOfAyahs: 25),
    85: Surah(name: "البُرُوجِ", numberOfAyahs: 22),
    86: Surah(name: "الطَّارِقِ", numberOfAyahs: 17),
    87: Surah(name: "الأَعۡلَىٰ", numberOfAyahs: 19),
    88: Surah(name: "الغَاشِيَةِ", numberOfAyahs: 26),
    89: Surah(name: "الفَجۡرِ", numberOfAyahs: 30),
    90: Surah(name: "البَلَدِ", numberOfAyahs: 20),
    91: Surah(name: "الشَّمۡسِ", numberOfAyahs: 15),
    92: Surah(name: "اللَّيۡلِ", numberOfAyahs: 21),
    93: Surah(name: "الضُّحَىٰ", numberOfAyahs: 11),
    94: Surah(name: "الشَّرۡحِ", numberOfAyahs: 8),
    95: Surah(name: "التِّينِ", numberOfAyahs: 8),
    96: Surah(name: "العَلَقِ", numberOfAyahs: 19),
    97: Surah(name: "القَدۡرِ", numberOfAyahs: 5),
    98: Surah(name: "البَيِّنَةِ", numberOfAyahs: 8),
    99: Surah(name: "الزَّلۡزَلَةِ", numberOfAyahs: 8),
    100: Surah(name: "العَادِيَاتِ", numberOfAyahs: 11),
    101: Surah(name: "القَارِعَةِ", numberOfAyahs: 11),
    102: Surah(name: "التَّكَاثُرِ", numberOfAyahs: 8),
    103: Surah(name: "العَصۡرِ", numberOfAyahs: 3),
    104: Surah(name: "الهُمَزَةِ", numberOfAyahs: 9),
    105: Surah(name: "الفِيلِ", numberOfAyahs: 5),
    106: Surah(name: "قُرَيۡشٍ", numberOfAyahs: 4),
    107: Surah(name: "المَاعُونِ", numberOfAyahs: 7),
    108: Surah(name: "الكَوۡثَرِ", numberOfAyahs: 3),
    109: Surah(name: "الكَافِرُونَ", numberOfAyahs: 6),
    110: Surah(name: "النَّصۡرِ", numberOfAyahs: 3),
    111: Surah(name: "المَسَدِ", numberOfAyahs: 5),
    112: Surah(name: "الإِخۡلَاصِ", numberOfAyahs: 4),
    113: Surah(name: "الفَلَقِ", numberOfAyahs: 5),
    114: Surah(name: "النَّاسِ", numberOfAyahs: 6),
  };

  static final HashMap<int, int> indices = HashMap.fromIterable(List.filled(6236, 0));
  static final List<int> verses = List.filled(6236, 0);

  static void precalculate() {
    int idx = 0;
    for (int s = 1; s <= 114; s++) {
      for (int a = 1; a <= map[s]!.numberOfAyahs; a++) {
        final ref = QuranRef.intRepr(s, a);
        indices[ref] = idx;
        verses[idx] = ref;
        idx++;
      }
    }
  }
}
