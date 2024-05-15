import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'migrations.dart';

Future<Database>? _database;

Future<Database> getConnection() async {
  _database ??= openDatabase(
    join(await getDatabasesPath(), 'almi.db'),
    version: 1,
    onConfigure: (db) {
      // dropAllTables(db);
      initMigration(db, 1);
    },
  );
  return _database!;
}

/*
FutureOr<void> dropAllTables(Database db) async {
  await db.execute('''
    drop table if exists android_metadata;
    drop table if exists meaning_en;
    drop table if exists meaning_ru;
    drop table if exists sqlite_master;
    drop table if exists sqlite_sequence;
    drop table if exists stem;
    drop table if exists transliteration_en;
    drop table if exists transliteration_ru;
  ''');
}
*/
