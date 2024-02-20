// Project imports:
import 'package:guidance/src/guidance.dart';
import 'package:guidance/src/translation/translation.dart';

abstract class TranslationServiceFrontend {
  Future<List<Translation>?> getList();
  Future<QuranObj?> getTranslation(String identifier);
}
