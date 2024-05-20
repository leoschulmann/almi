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

  static Future<List<Stem>> getStems(int limit, int offset) async {
    Database database = await getConnection();

    List<Map<String, Object?>> resultsetStem = await database.query(
      'stem',
      columns: ['id', 'hebrew'],
      limit: limit,
      offset: offset,
      orderBy: 'hebrew',
    );

    List<int> ids = resultsetStem.map((tuple) => tuple['id'] as int).toList();

    Map<int, Map<ForeignLang, String>> transliterations = await _getTransliterationsForWordIdIn(ids);

    Map<int, Map<ForeignLang, List<String>>> meanings = await _getMeaningsForWordIdIn(ids);

    return resultsetStem.map((tuple) => _mapTupleToStem(tuple, transliterations, meanings)).toList();
  }

  static Stem _mapTupleToStem(Map<String, Object?> tuple, Map<int, Map<ForeignLang, String>> transliterations,
      Map<int, Map<ForeignLang, List<String>>> meanings) {
    int id = tuple['id'] as int;
    return Stem(
      id: id,
      valueHebrew: {HebrewLang.simple: tuple['hebrew'] as String},
      transliteration: transliterations[id] ??= {
        ForeignLang.en: 'n/a',
        ForeignLang.ru: 'n/a'
        //todo propagate other langs
      },
      meanings: meanings[id] ??= {
        ForeignLang.en: ['n/a'],
        ForeignLang.ru: ['n/a']
      },
    );
  }

  static Future<Map<int, Map<ForeignLang, List<String>>>> _getMeaningsForWordIdIn(List<int> ids) async {
    Database database = await getConnection();

    Map<int, Map<ForeignLang, List<String>>> meanings = await database
        .query(
      'meaning',
      columns: ['word_id', 'value', 'lang'],
      where: 'word_id IN (${ids.join(', ')})',
    )
        .then((List<Map<String, Object?>> rows) {
      Map<Object?, List<Map<String, Object?>>> grouped = groupBy(rows, (row) => row['word_id']);

      return Map<int, Map<ForeignLang, List<String>>>.fromEntries(
        grouped.entries.map(
          (e) {
            int wordId = e.key as int;
            List<Map<String, Object?>> value = e.value;

            Map<Object?, List<Map<String, Object?>>> groupedByLang = groupBy(value, (row) => row['lang']);

            Map<ForeignLang, List<String>> map = Map<ForeignLang, List<String>>.fromEntries(
              groupedByLang.entries.map(
                (MapEntry<Object?, List<Map<String, Object?>>> pair) {
                  ForeignLang lang = parseForeignLang(pair.key as String);
                  List<String> meanings = pair.value.map((e) => e['value'] as String).toList();
                  return MapEntry<ForeignLang, List<String>>(lang, meanings);
                },
              ),
            );
            return MapEntry(wordId, map);
            // return null;
          },
        ),
      );
    });
    return meanings;
  }

  static Future<Map<int, Map<ForeignLang, String>>> _getTransliterationsForWordIdIn(List<int> ids) async {
    Database database = await getConnection();

    Map<int, Map<ForeignLang, String>> transliterations = await database
        .query(
      'transliteration',
      columns: ['word_id', 'value', 'lang'],
      where: 'word_id IN (${ids.join(', ')})',
    )
        .then((List<Map<String, Object?>> rows) {
      Map<Object?, List<Map<String, Object?>>> grouped = groupBy(rows, (row) => row['word_id']);

      return Map<int, Map<ForeignLang, String>>.fromEntries(
        grouped.entries.map(
          (MapEntry<Object?, List<Map<String, Object?>>> tuple) {
            Map<ForeignLang, String> map = Map<ForeignLang, String>.fromEntries(
              tuple.value.map(
                (Map<String, Object?> m) {
                  ForeignLang lang = parseForeignLang(m['lang'] as String);
                  String transliteration = m['value'] as String;
                  return MapEntry(lang, transliteration);
                },
              ),
            );
            return MapEntry(tuple.key as int, map);
          },
        ),
      );
    });
    return transliterations;
  }
}
