import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:collection/collection.dart';
import 'package:sqflite_common/sqlite_api.dart';

class CommonDAO {
  static Future<void> printAll() async {
    Database database = await getConnection();
    List<Map<String, dynamic>> query = await database.query('stem');
    for (var value in query) {
      print(value);
    }
  }

  static Future<void> getAllStems() async {
    Database database = await getConnection();

    List<Map<String, Object?>> resultsetStem = await database.query('stem',
        columns: ['id', 'hebrew'], limit: 50, orderBy: 'hebrew');

    List<int> ids = [];

    for (Map<String, Object?> value in resultsetStem) {
      ids.add(value['id'] as int);
    }

    String whereClause = 'word_id IN (${ids.join(', ')})';

    Map<int, Map<ForeignLang, String>> transliterations = await database
        .query(
      'transliteration',
      columns: ['word_id', 'value', 'lang'],
      where: whereClause,
    )
        .then((List<Map<String, Object?>> rows) {
      Map<Object?, List<Map<String, Object?>>> grouped =
          groupBy(rows, (row) => row['word_id']);

      return Map<int, Map<ForeignLang, String>>.fromEntries(grouped.entries
          .map((MapEntry<Object?, List<Map<String, Object?>>> tuple) {
        Map<ForeignLang, String> langValMap =
            Map<ForeignLang, String>.fromEntries(
                tuple.value.map((Map<String, Object?> m) {
          String value = m['value'] as String;
          ForeignLang lang = parseForeignLang(m['lang'] as String);
          return MapEntry(lang, value);
        }));

        return MapEntry(tuple.key as int, langValMap);
      }));
    });

    Map<int, Map<ForeignLang, List<String>>> meanings2 = await database
        .query(
      'meaning',
      columns: ['word_id', 'value', 'lang'],
      where: whereClause,
    )
        .then((List<Map<String, Object?>> rows) {
      Map<Object?, List<Map<String, Object?>>> grouped =
          groupBy(rows, (row) => row['word_id']);

      return Map<int, Map<ForeignLang, List<String>>>.fromEntries(grouped
          .entries
          .map((MapEntry<Object?, List<Map<String, Object?>>> e) {
        int wordId = e.key as int;
        List<Map<String, Object?>> value = e.value;

        Map<Object?, List<Map<String, Object?>>> groupBy2 =
            groupBy(value, (row) => row['lang']);
        Map<ForeignLang, List<String>> map =
            Map<ForeignLang, List<String>>.fromEntries(groupBy2.entries
                .map((MapEntry<Object?, List<Map<String, Object?>>> perLang) {
          String langStrin = perLang.key as String;
          ForeignLang parseForeignLang12 = parseForeignLang(langStrin);
          List<String> list12 = perLang.value
              .map((Map<String, Object?> e) => e['value'] as String)
              .toList();
          return MapEntry<ForeignLang, List<String>>(
              parseForeignLang12, list12);
        }));
        return MapEntry(wordId, map);
        // return null;
      }));
    });

    Map<int, List<String>> meanings = await database
        .query(
      'meaning',
      columns: ['word_id', 'value', 'lang'],
      where: whereClause,
    )
        .then((List<Map<String, Object?>> rows) {
      Map<Object?, List<Map<String, Object?>>> groupedRows =
          groupBy(rows, (row) => row['word_id']);

      return Map<int, List<String>>.fromEntries(
          groupedRows.entries.map((entry) {
        var wordId = entry.key as int;
        var values = entry.value.map((row) => row['value'] as String).toList();
        return MapEntry<int, List<String>>(wordId, values);
      }));
    });

    List<Stem> list = resultsetStem.map((Map<String, Object?> row) {
      int id = row['id'] as int;
      String spelling = row['hebrew'] as String;
      return Stem(
          id: id,
          valueHebrew: {HebrewLang.simple: spelling},
          transliteration: transliterations[id] ??= {
            ForeignLang.en: 'n/a',
            ForeignLang.ru: 'n/a'
            //todo propagate other langs
          },
          meanings: meanings2[id] ??= {
            ForeignLang.en: ['n/a'],
            ForeignLang.ru: ['n/a']
          });
    }).toList();

  }
}
