import 'package:get/get.dart';
import 'package:store/core/translation/languages/ar_language.dart';
import 'package:store/core/translation/languages/en_language.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": EnLangrage.map,
        "ar_SA": ArLanguage.map,
      };
}

tr(String key) => key.tr;
