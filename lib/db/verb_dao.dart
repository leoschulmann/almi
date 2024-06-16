import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:ani_lo_medaber_ivrit/db/samples_dao.dart';
import 'package:ani_lo_medaber_ivrit/db/translations_dao.dart';
import 'package:ani_lo_medaber_ivrit/db/transliteration_dao.dart';
import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/binyan.dart';
import 'package:ani_lo_medaber_ivrit/models/sample.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:ani_lo_medaber_ivrit/models/verb_info.dart';

class VerbDAO {
  static Future<List<Verb>> getVerbsForStem(Stem stem, {VerbInfo verbInfo = VerbInfo.verbInfinitive}) async {
    List<Map<String, Object?>> resultSet = await sqlite.query('verb',
        columns: [
          'id',
          'hebrew',
          'nikkud',
          'binyan',
        ],
        where: '''stem_id = ${stem.id} AND 
          form = '${verbInfo.form.name}' AND 
          person = '${verbInfo.person.name}' AND 
          plurality = '${verbInfo.plurality.name}\'''',
        orderBy: 'hebrew');

    List<int> verbIds = resultSet.map((tuple) => tuple['id'] as int).toList();

    Map<int, Map<ForeignLang, String>> verbIdTotransliterations =
        await TransliterationDAO.getTransliterationsForWordIds(verbIds);

    Map<int, Map<ForeignLang, List<String>>> verbIdToTranslations =
        await TranslationsDAO.getTranslationsForWordIds(verbIds);

    List<Verb> list = resultSet
        .map((tuple) => _mapTupleToVerb(
            tuple,
            verbInfo,
            stem,
            [], // at stems screen cards samples are not needed
            verbIdTotransliterations[tuple['id']!] ?? TransliterationDAO.defaultTransliterations,
            verbIdToTranslations[tuple['id']] ?? TranslationsDAO.defaultTranslations))
        .toList();

    return list;
  }

  static Future<List<Verb>> getAllVerbForms(Stem stem, Binyan binyan) async {
    List<Map<String, Object?>> resultSet = await sqlite.query('verb', columns: [
      'id',
      'hebrew',
      'nikkud',
      'binyan',
      'form',
      'person',
      'plurality',
    ], where: '''
    stem_id = ${stem.id} AND binyan = '${Binyan.getByBinyan(binyan).name}'
    ''');

    List<int> verbIds = resultSet.map((tuple) => tuple['id'] as int).toList();

    Map<int, List<Sample>> verbIdToSamplesMap = await SamplesDAO.getSamplesForWordIds(verbIds);

    Map<int, Map<ForeignLang, String>> verbIdTotransliterations =
        await TransliterationDAO.getTransliterationsForWordIds(verbIds);

    Map<int, Map<ForeignLang, List<String>>> verbIdToTranslations =
        await TranslationsDAO.getTranslationsForWordIds(verbIds);

    List<Verb> list = resultSet.map((tuple) {
      int verbId = tuple['id']! as int;
      return _mapTupleToVerb(
          tuple,
          VerbInfo(
            GrammaticalPerson.get(tuple['person'] as String),
            Plurality.get(tuple['plurality'] as String),
            VerbForm.get(tuple['form'] as String),
          ),
          stem,
          verbIdToSamplesMap[verbId] ?? [],
          verbIdTotransliterations[verbId] ?? TransliterationDAO.defaultTransliterations,
          verbIdToTranslations[verbId] ?? TranslationsDAO.defaultTranslations);
    }).toList();

    return list;
  }

  static Verb _mapTupleToVerb(Map<String, Object?> tuple, VerbInfo verbInfo, Stem stem, List<Sample> samples,
      Map<ForeignLang, String> transliterations, Map<ForeignLang, List<String>> translations) {
    Binyan binyan = Binyan.get(tuple['binyan'] as String);
    Map<HebrewLang, String> hebrew = {
      HebrewLang.simple: tuple.containsKey('hebrew') ? tuple['hebrew'] as String : 'n/a',
      HebrewLang.nikkud: tuple.containsKey('nikkud') ? tuple['nikkud'] as String : 'n/a',
    };

    return Verb(
        binyan: binyan,
        stem: stem,
        info: verbInfo,
        samples: samples,
        valueHebrew: hebrew,
        transliteration: transliterations,
        meanings: translations);
  }
}
