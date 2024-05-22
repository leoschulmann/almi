import 'dart:async';

import 'package:ani_lo_medaber_ivrit/db/migrations/v1.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String _dbName = 'almi.db';

Database? _db;

Database get sqlite {
  if(_db == null) {
    throw Exception("db not initialized");
  }
  return _db!;
}

Future<void> initDb() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, _dbName);

  await deleteDatabase(path); //todo testing only

  _db = await openDatabase(
    _dbName,
    version: 1,
    onConfigure: (db) => _configureCallback(db),
    onCreate: (db, version) => _createDbCallback(db),
    onUpgrade: (db, oldVer, newVer) => _migrateDbCallback(db, oldVer, newVer),
  );
}

_configureCallback(Database db) {}

_createDbCallback(Database db) {
  for (var dropQuery in dropQueries) { //todo testing only
    db.execute(dropQuery);
  }

  db.execute(createStemTable);
  db.execute(createTransliterationTable);
  db.execute(createMeaningTable);

  var batch = db.batch();
  for (var query in populateDataQueries) {
    batch.rawInsert(query);
  }

  batch.commit();
}

_migrateDbCallback(Database db, int oldVersion, int newVersion) {}
