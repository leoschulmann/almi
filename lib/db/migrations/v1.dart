const List<String> dropQueries = [
  'drop table if exists android_metadata;',
  'drop table if exists meaning_en;',
  'drop table if exists meaning_ru;',
  'drop table if exists stem;',
  'drop table if exists transliteration_en;',
  'drop table if exists transliteration_ru;',
  'drop table if exists word_meaning;',
  'drop table if exists verb;',
  'drop table if exists sample;',
  'drop table if exists sample_meaning;',
  'drop table if exists transliteration;',
];

const String createStemTable = '''
    create table stem(
    id     integer      not null constraint stem_pk primary key autoincrement,
    hebrew TEXT         not null,
    nikkud TEXT not null);
    ''';

const String createTransliterationTable = '''
    create table transliteration(
    id      integer not null constraint transliteration_en_pk primary key autoincrement,
    word_id integer not null,
    value   TEXT    not null,
    lang    TEXT    not null);
    ''';

const String createMeaningTable = '''
    create table word_meaning(
    id      integer not null constraint meaning_ru_pk primary key autoincrement,
    word_id integer not null,
    value   text    not null,
    lang    TEXT    not null);
    ''';

const String createVerbTable = '''
create table verb(
    id        integer not null constraint verb_pk primary key autoincrement,
    hebrew    TEXT    not null,
    nikkud    TEXT    not null,
    stem_id   integer not null constraint verb_stem_id_fk references stem,
    binyan    TEXT    not null,
    form      TEXT    not null,
    person    TEXT    not null,
    plurality TEXT    not null);
    ''';

const String createSampleSentenceTable = '''
create table sample(
    id      integer not null constraint sample_pk primary key autoincrement,
    word_id integer not null,
    val     TEXT    not null,
    liked   INTEGER default 0);
''';

const String createSampleTranslationsTable = '''
create table sample_meaning(
    id        integer not null constraint sample_meaning_pk primary key autoincrement ,
    sample_id integer not null constraint sample_meaning_sample_id_fk references sample,
    value     TEXT    not null,
    lang      TEXT    not null);
''';


const List<String> populateDataQueries = [
  '''
  insert into stem (hebrew, nikkud) values 
  ('כתב','כתב'),
  ('אכל','אכל'),
  ('אמר','אמר'),
  ('הלך','הלך'),
  ('עשה','עשה'),
  ('ראה','ראה'),
  ('ישב','ישב'),
  ('שמע','שמע'),
  ('לקח','לקח'),
  ('ידע','ידע'),
  ('שתה','שתה'),
  ('עבד','עבד');
  ''',
  '''
insert into word_meaning (word_id, value, lang) values 
((select id from stem where hebrew = 'כתב'), 'work', 'en'),
((select id from stem where hebrew = 'כתב'), 'писать', 'ru'),

((select id from stem where hebrew = 'אכל'), 'eat', 'en'),
((select id from stem where hebrew = 'אכל'), 'есть', 'ru'),

((select id from stem where hebrew = 'אמר'), 'say', 'en'),
((select id from stem where hebrew = 'אמר'), 'говорить', 'ru'),
((select id from stem where hebrew = 'אמר'), 'сказать', 'ru'),

((select id from stem where hebrew = 'הלך'), 'walk', 'en'),
((select id from stem where hebrew = 'הלך'), 'go', 'en'),
((select id from stem where hebrew = 'הלך'), 'идти', 'ru'),

((select id from stem where hebrew = 'עשה'), 'do', 'en'),
((select id from stem where hebrew = 'עשה'), 'make', 'en'),
((select id from stem where hebrew = 'עשה'), 'делать', 'ru'),

((select id from stem where hebrew = 'ראה'), 'see', 'en'),
((select id from stem where hebrew = 'ראה'), 'видеть', 'ru'),

((select id from stem where hebrew = 'ישב'), 'sit', 'en'),
((select id from stem where hebrew = 'ישב'), 'сидеть', 'ru'),

((select id from stem where hebrew = 'שמע'), 'hear', 'en'),
((select id from stem where hebrew = 'שמע'), 'слышать', 'ru'),

((select id from stem where hebrew = 'לקח'), 'take', 'en'),
((select id from stem where hebrew = 'לקח'), 'брать', 'ru'),

((select id from stem where hebrew = 'ידע'), 'know', 'en'),
((select id from stem where hebrew = 'ידע'), 'знать', 'ru'),

((select id from stem where hebrew = 'שתה'), 'drink', 'en'),
((select id from stem where hebrew = 'שתה'), 'пить', 'ru'),

((select id from stem where hebrew = 'עבד'), 'work', 'en'),
((select id from stem where hebrew = 'עבד'), 'работать', 'ru');
''',
'''
insert into verb (stem_id, hebrew, nikkud, binyan, person, plurality, form) values 
((select id from stem where hebrew = 'כתב'), 'לכתוב', 'לִכְתוֹב', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'אכל'), 'לאכול', 'לֶאֱכוֹל', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'אמר'), 'לומר', 'לוֹמַר', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'הלך'), 'ללכת', 'לָלֶכֶת', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'עשה'), 'לעשות', 'לַעֲשׂוֹת', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'ראה'), 'לראות', 'לִרְאוֹת', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'ישב'), 'לשבת', 'לָשֶׁבֶת', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'שמע'), 'לשמוע', 'לִשְׁמוֹעַ', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'לקח'), 'לקחת', 'לָקַחַת', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'ידע'), 'לדעת', 'לָדַעַת', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'שתה'), 'לשתות', 'לִשְׁתוֹת', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'עבד'), 'לעבוד', 'לַעֲבוֹד', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'עבד'), 'לעבד', 'לְעַבֵּד', 'piel', 'none', 'none', 'infinitive');
''',
'''
insert into word_meaning (word_id, value, lang) values
((select id from verb where hebrew = 'לכתוב'), 'писать', 'ru'),
((select id from verb where hebrew = 'לאכול'), 'есть', 'ru'),
((select id from verb where hebrew = 'לומר'), 'сказать', 'ru'),
((select id from verb where hebrew = 'ללכת'), 'идти', 'ru'),
((select id from verb where hebrew = 'לעשות'), 'делать', 'ru'),
((select id from verb where hebrew = 'לראות'), 'видеть', 'ru'),
((select id from verb where hebrew = 'לשבת'), 'сидеть', 'ru'),
((select id from verb where hebrew = 'לשמוע'), 'слышать', 'ru'),
((select id from verb where hebrew = 'לקחת'), 'брать', 'ru'),
((select id from verb where hebrew = 'לדעת'), 'знать', 'ru'),
((select id from verb where hebrew = 'לשתות'), 'пить', 'ru'),
((select id from verb where hebrew = 'לעבוד'), 'работать', 'ru'),
((select id from verb where hebrew = 'לעבד'), 'обрабатывать', 'ru');

insert into word_meaning (word_id, value, lang) values
((select id from verb where hebrew = 'לכתוב'), 'to write', 'en'),
((select id from verb where hebrew = 'לאכול'), 'to eat', 'en'),
((select id from verb where hebrew = 'לומר'), 'to say', 'en'),
((select id from verb where hebrew = 'ללכת'), 'to go', 'en'),
((select id from verb where hebrew = 'ללכת'), 'to walk', 'en'),
((select id from verb where hebrew = 'לעשות'), 'to do', 'en'),
((select id from verb where hebrew = 'לעשות'), 'to make', 'en'),
((select id from verb where hebrew = 'לראות'), 'to see', 'en'),
((select id from verb where hebrew = 'לשבת'), 'to sit', 'en'),
((select id from verb where hebrew = 'לשמוע'), 'to hear', 'en'),
((select id from verb where hebrew = 'לקחת'), 'to take', 'en'),
((select id from verb where hebrew = 'לדעת'), 'to know', 'en'),
((select id from verb where hebrew = 'לשתות'), 'to drink', 'en'),
((select id from verb where hebrew = 'לעבוד'), 'to work', 'en'),
((select id from verb where hebrew = 'לעבד'), 'to process', 'en'),
((select id from verb where hebrew = 'לעבד'), 'to work on', 'en');
''',
'''
insert into transliteration (word_id, value, lang) values
((select id from verb where hebrew = 'לכתוב'), 'лихтов', 'ru'),
((select id from verb where hebrew = 'לאכול'), 'леэхоль', 'ru'),
((select id from verb where hebrew = 'לומר'), 'ломар', 'ru'),
((select id from verb where hebrew = 'ללכת'), 'лалехет', 'ru'),
((select id from verb where hebrew = 'לעשות'), 'лаасот', 'ru'),
((select id from verb where hebrew = 'לראות'), 'лирот', 'ru'),
((select id from verb where hebrew = 'לשבת'), 'лашевет', 'ru'),
((select id from verb where hebrew = 'לשמוע'), 'лишмоа', 'ru'),
((select id from verb where hebrew = 'לקחת'), 'лакахат', 'ru'),
((select id from verb where hebrew = 'לדעת'), 'ладаат', 'ru'),
((select id from verb where hebrew = 'לשתות'), 'лиштот', 'ru'),
((select id from verb where hebrew = 'לעבוד'), 'лаавод', 'ru'),
((select id from verb where hebrew = 'לעבד'), 'леабед', 'ru');

insert into transliteration (word_id, value, lang) values
((select id from verb where hebrew = 'לכתוב'), 'likhtov', 'en'),
((select id from verb where hebrew = 'לאכול'), 'le\'ekhol', 'en'),
((select id from verb where hebrew = 'לומר'), 'lomar', 'en'),
((select id from verb where hebrew = 'ללכת'), 'lalekhet', 'en'),
((select id from verb where hebrew = 'לעשות'), 'la\'asot', 'en'),
((select id from verb where hebrew = 'לראות'), 'lir\'ot', 'en'),
((select id from verb where hebrew = 'לשבת'), 'lashevet', 'en'),
((select id from verb where hebrew = 'לשמוע'), 'lishmoa', 'en'),
((select id from verb where hebrew = 'לקחת'), 'lakakhat', 'en'),
((select id from verb where hebrew = 'לדעת'), 'ladaat', 'en'),
((select id from verb where hebrew = 'לשתות'), 'lishtot', 'en'),
((select id from verb where hebrew = 'לעבוד'), 'la\'avod', 'en'),
((select id from verb where hebrew = 'לעבד'), 'le\'abed', 'en');
'''
];
