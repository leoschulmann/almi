import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:collection/collection.dart';

class TranslationsDAO {
  static const Map<ForeignLang, List<String>> defaultTranslations = {
    ForeignLang.en: ['n/a'],
    ForeignLang.ru: ['n/a']
  };

  static Future<Map<int, Map<ForeignLang, List<String>>>> getTranslationsForWordIds(List<int> ids) async {
    String whereIn = ids.join(', ');

    List<Map<String, Object?>> resultSet = await sqlite.query(
      'word_meaning',
      columns: ['word_id', 'value', 'lang'],
      where: 'word_id IN ($whereIn)',
    );

    Map<int, Map<ForeignLang, List<String>>> result = Map<int, Map<ForeignLang, List<String>>>.fromEntries(
      groupBy(resultSet, (row) => row['word_id'] as int).entries.map(
        (wordIdGroup) {
          Map<ForeignLang, List<String>> wordTranslations = Map<ForeignLang, List<String>>.fromEntries(
              groupBy(wordIdGroup.value, (row) => row['lang'] as String).entries.map((langGroup) {
            List<String> translations = langGroup.value.map((e) => e['value'] as String).toList();
            return MapEntry(parseForeignLang(langGroup.key), translations);
          }));

          return MapEntry(wordIdGroup.key, wordTranslations);
        },
      ),
    );

    return result;
  }
}
