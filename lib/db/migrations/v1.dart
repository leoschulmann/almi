const List<String> dropQueries = [
  'drop table if exists android_metadata;',
  'drop table if exists meaning_en;',
  'drop table if exists meaning_ru;',
  'drop table if exists stem;',
  'drop table if exists transliteration_en;',
  'drop table if exists transliteration_ru;',
  'drop table if exists meaning;',
  'drop table if exists transliteration;',
];

const String createStemTable = '''
    create table stem(
    id     integer      not null constraint stem_pk primary key autoincrement,
    hebrew TEXT         not null,
    nikkud TEXT not null
    );
    ''';

const String createTransliterationTable = '''
    create table transliteration(
    id      integer not null constraint transliteration_en_pk primary key autoincrement,
    word_id integer not null,
    value   TEXT    not null,
    lang    TEXT    not null
    );
    ''';

const String createMeaningTable = '''
    create table meaning(
    id      integer not null constraint meaning_ru_pk primary key autoincrement,
    word_id integer not null,
    value   text    not null,
    lang    TEXT    not null
    );
    ''';

const List<String> populateDataQueries = [
  '''
  insert into stem (hebrew, nikkud) values 
  ('שתה','שתה'),
  ('אכל','אכל'),
  ('כתב','כתב'),
  ('עבד','עבד');
  ''',
  '''
insert into meaning (word_id, value, lang) values 
((select id from stem where hebrew = 'עבד'), 'work', 'en'),
((select id from stem where hebrew = 'עבד'), 'работать', 'ru'),
((select id from stem where hebrew = 'עבד'), 'toil', 'en'),
((select id from stem where hebrew = 'עבד'), 'labor', 'en'),
((select id from stem where hebrew = 'אכל'), 'есть', 'ru'),
((select id from stem where hebrew = 'אכל'), 'eat', 'en'),
((select id from stem where hebrew = 'אכל'), 'consume', 'en');
''',
  '''
  insert into transliteration (word_id, value, lang) values 
((select id from stem where hebrew = 'כתב'), 'katav', 'en'),
((select id from stem where hebrew = 'עבד'), 'avad', 'en');
  ''',
];
