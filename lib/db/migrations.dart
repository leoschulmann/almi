import 'dart:async';

import 'package:sqflite/sqflite.dart';

FutureOr<void> initMigration(Database db, int version) async {
  await db.execute('drop table if exists android_metadata;');
  await db.execute('drop table if exists meaning_en;');
  await db.execute('drop table if exists meaning_ru;');
  await db.execute('drop table if exists stem;');
  await db.execute('drop table if exists transliteration_en;');
  await db.execute('drop table if exists transliteration_ru;');
  await db.execute('drop table if exists meaning;');
  await db.execute('drop table if exists transliteration;');

  await db.execute('''
    create table stem(
    id     integer      not null constraint stem_pk primary key autoincrement,
    hebrew TEXT         not null,
    nikkud TEXT not null, 
    binyan TEXT not null
    );
    ''');

  await db.execute('''
    create table transliteration(
    id      integer not null constraint transliteration_en_pk primary key autoincrement,
    word_id integer not null,
    value   TEXT    not null,
    lang    TEXT    not null
    );
    ''');

  await db.execute('''
    create table meaning(
    id      integer not null constraint meaning_ru_pk primary key autoincrement,
    word_id integer not null,
    value   text    not null,
    lang    TEXT    not null
    );
    ''');

  Batch batch = db.batch();
  batch.rawInsert('''
  insert into stem (hebrew, nikkud, binyan) values 
  ('אכל','אכל' , 'paal'),
  ('כתב','כתב', 'paal'),
  ('עבד','עבד', 'paal');
  ''');

  batch.rawInsert('''
insert into meaning (word_id, value, lang) values 
((select id from stem where hebrew = 'עבד'), 'work', 'en'),
((select id from stem where hebrew = 'עבד'), 'работать', 'ru'),
((select id from stem where hebrew = 'עבד'), 'toil', 'en'),
((select id from stem where hebrew = 'עבד'), 'labor', 'en'),
((select id from stem where hebrew = 'אכל'), 'есть', 'ru'),
((select id from stem where hebrew = 'אכל'), 'eat', 'en'),
((select id from stem where hebrew = 'אכל'), 'consume', 'en');
''');

  batch.rawInsert('''
  insert into transliteration (word_id, value, lang) values 
((select id from stem where hebrew = 'כתב'), 'katav', 'en'),
((select id from stem where hebrew = 'עבד'), 'avad', 'en');
  ''');

  await batch.commit();
  print('finished migration');
}
