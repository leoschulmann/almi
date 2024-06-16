import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/sample.dart';
import 'package:collection/collection.dart';

class SamplesDAO {
  static Future<Map<int, List<Sample>>> getSamplesForWordIds(List<int> verbIds) async {
    String samplesWhereIn = verbIds.join(', ');

    List<Map<String, Object?>> samplesResultSet = await sqlite.query(
      'verb_sample',
      columns: ['id', 'verb_id', 'value', 'liked'],
      where: 'verb_id IN ($samplesWhereIn)',
    );

    Map<int, List<SampleTranslation>> sampleIdToTranslations =
        await _getTranslations(samplesResultSet.map((tuple) => tuple['id'] as int));

    return groupBy(samplesResultSet.map((tuple) {
      int id = tuple['id'] as int;
      return Sample(id, tuple['verb_id'] as int, tuple['value'] as String, tuple['liked'] == 1,
          sampleIdToTranslations[id] ??= []);
    }), (p0) => p0.verbId);
  }

  static Future<Map<int, List<SampleTranslation>>> _getTranslations(Iterable<int> samplesIds) async {
    String translationsWhereIn = samplesIds.join(', ');

    List<Map<String, Object?>> translatedSamplesResultSet = await sqlite.query('verb_sample_translation',
        columns: ['sample_id', 'value', 'lang'], where: 'sample_id IN ($translationsWhereIn)');

    return groupBy(translatedSamplesResultSet.map((tuple) {
      return SampleTranslation(
          tuple['sample_id'] as int, tuple['value'] as String, parseForeignLang(tuple['lang'] as String));
    }), (SampleTranslation t) => t.sampleId);
  }

  static Future<int> setLiked(int sampleId, bool liked) async {
    return await sqlite.update('verb_sample', {'liked': liked ? 1 : 0}, where: 'id = $sampleId');
  }
}
