import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:collection/collection.dart';

class SamplesDAO {
  //todo simple samples as strings
  static Future<Map<int, List<String>>> getSamplesForWordIds(List<int> ids) async {
    String whereIn = ids.join(', ');

    List<Map<String, Object?>> samplesResultSet = await sqlite.query(
      'sample',
      columns: ['word_id', 'val'],
      where: 'word_id IN ($whereIn)',
    );

    return Map<int, List<String>>.fromEntries(
      groupBy(samplesResultSet, (tuple) => tuple['word_id']).entries.map(
        (group) {
          int verbId = group.key as int;
          List<String> list = group.value.map((e) => e['val'] as String).toList();
          return MapEntry(verbId, list);
        },
      ),
    );
  }
}
