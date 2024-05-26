import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:collection/collection.dart';

class TransliterationDAO {
  static const Map<ForeignLang, String> defaultTransliterations = {ForeignLang.en: "n/a", ForeignLang.ru: "n/a"};

  static Future<Map<int, Map<ForeignLang, String>>> getTransliterationsForWordIds(List<int> ids) async {
    String whereIn = ids.join(', ');

    List<Map<String, Object?>> resultSet = await sqlite.query(
      'verb_transliteration',
      columns: ['verb_id', 'value', 'lang'],
      where: 'verb_id IN ($whereIn)',
    );

    return Map<int, Map<ForeignLang, String>>.fromEntries(
        groupBy(resultSet, (tuple) => tuple['verb_id']).entries.map((group) {
      Map<ForeignLang, String> transliterations = Map<ForeignLang, String>.fromEntries(
        group.value.map(
          (row) => MapEntry(parseForeignLang(row['lang'] as String), row['value'] as String),
        ),
      );
      return MapEntry(group.key as int, transliterations);
    }));
  }
}
