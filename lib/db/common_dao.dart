import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:sqflite_common/sqlite_api.dart';

class CommonDAO {
  static Future<void> printAll() async {
    Database database = await getConnection();
    List<Map<String, dynamic>> query = await database.query('stem');
    for (var value in query) {
      print(value);
    }
  }
  //
  // static Future<int> insertStem(Stem stem) {}
  //
  // static Future<void> insertTransliterationRU(int wordId, String value) async {
  //   Database database = await DB.connectDatabase();
  // }
  //
  // static Future<void> insertTransliterationEN(int wordId, String value) {}
  //
  // static Future<void> insertMeaningRU(int wordId, List<String> value) {}
  //
  // static Future<void> insertMeaningEN(int wordId, List<String> value) {}
}
