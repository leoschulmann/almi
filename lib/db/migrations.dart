import 'dart:async';

import 'package:sqflite/sqflite.dart';

FutureOr<void> initMigration(Database db, int version) async {
  await db.execute('''
    create table stem(
    id     integer      not null constraint stem_pk primary key autoincrement,
    hebrew TEXT         not null,
    nikkud TEXT not null
    );
    ''');

  await db.execute('''
    create table transliteration_ru(
    id      integer not null constraint transliteration_ru_pk primary key autoincrement,
    word_id integer not null,
    value   TEXT not null
    );
    ''');

  await db.execute('''create table transliteration_en(
    id      integer not null constraint transliteration_en_pk primary key autoincrement,
    word_id integer not null,
    value   TEXT    not null
    );
    ''');

  await db.execute('''
    create table meaning_en(
    id      integer not null constraint meaning_en_pk primary key autoincrement,
    word_id integer not null,
    value   text    not null
    );
    ''');

  await db.execute('''
    create table meaning_ru(
    id      integer not null constraint meaning_ru_pk primary key autoincrement,
    word_id integer not null,
    value   text    not null
    );
    ''');

  Batch batch = db.batch();
  batch.insert('stem', {'hebrew': 'foo', 'nikkud': 'bar'});
  batch.insert('stem', {'hebrew': 'אכל', 'nikkud': 'אכל'});
  batch.insert('stem', {'hebrew': 'ыыы', 'nikkud': 'ыыы'});
  batch.insert('stem', {'hebrew': 'עבד', 'nikkud': 'עבד'});
  await batch.commit();
}
