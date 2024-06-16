const List<String> dropQueries = [
  'drop table if exists android_metadata;',
  'drop table if exists sample;',
  'drop table if exists sample_meaning;',
  'drop table if exists stem;',
  'drop table if exists stem_translation;',
  'drop table if exists verb;',
  'drop table if exists verb_translation;',
  'drop table if exists verb_transliteration;',
];

const String createStemTable = '''
    create table stem(
    id     integer      not null constraint stem_pk primary key autoincrement,
    hebrew TEXT         not null,
    nikkud TEXT not null);
    ''';

const String createStemTranslationTable = '''
    create table stem_translation(
    id      integer not null constraint meaning_ru_pk primary key autoincrement,
    stem_id integer not null constraint stem_translation_stem_id_fk references stem,
    value   text    not null,
    lang    TEXT    not null);
    ''';

const String createStemTranslitTable = '''
    create table stem_transliteration(
    id      integer not null constraint transliteration_en_pk primary key autoincrement,
    stem_id integer not null constraint stem_translit_stem_id_fk references stem,
    value   TEXT    not null,
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

const String createVerbTranslationTable = '''
create table verb_translation(
    id      integer not null constraint verb_translation_pk primary key autoincrement,
    verb_id integer not null constraint verb_translation_verb_id_fk references verb,
    value   TEXT    not null,
    lang    TEXT    not null);
''';

const String createVerbTranslitTable = '''
    create table verb_transliteration(
    id      integer not null constraint transliteration_en_pk primary key autoincrement,
    verb_id integer not null constraint verb_translation_verb_id_fk references verb,
    value   TEXT    not null,
    lang    TEXT    not null);
    ''';

const String createVerbSampleSentenceTable = '''
create table verb_sample(
    id      integer not null constraint sample_pk primary key autoincrement,
    verb_id integer not null constraint verb_sample_verb_id_fk references verb,
    value   TEXT    not null,
    liked   INTEGER default 0);
''';

const String createVerbSampleTranslationsTable = '''
create table verb_sample_translation(
    id        integer not null constraint sample_meaning_pk primary key autoincrement ,
    sample_id integer not null constraint sample_meaning_sample_id_fk references verb_sample,
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
insert into stem_translation (stem_id, value, lang) values 
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
  // various infinitives
  '''
insert into verb (stem_id, hebrew, nikkud, binyan, person, plurality, form) values 
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
  // translations for various infinitives
  '''
insert into verb_translation (verb_id, value, lang) values
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
((select id from verb where hebrew = 'לעבד'), 'обрабатывать', 'ru'),
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
  // transliterations for various infinitives
  '''
insert into verb_transliteration (verb_id, value, lang) values
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
((select id from verb where hebrew = 'לעבד'), 'леабед', 'ru'),
((select id from verb where hebrew = 'לומר'), 'lomar', 'en'),
((select id from verb where hebrew = 'ללכת'), 'lalekhet', 'en'),
((select id from verb where hebrew = 'לעשות'), 'la''asot', 'en'),
((select id from verb where hebrew = 'לראות'), 'lir''ot', 'en'),
((select id from verb where hebrew = 'לשבת'), 'lashevet', 'en'),
((select id from verb where hebrew = 'לשמוע'), 'lishmoa', 'en'),
((select id from verb where hebrew = 'לקחת'), 'lakakhat', 'en'),
((select id from verb where hebrew = 'לדעת'), 'ladaat', 'en'),
((select id from verb where hebrew = 'לשתות'), 'lishtot', 'en'),
((select id from verb where hebrew = 'לעבוד'), 'la''avod', 'en'),
((select id from verb where hebrew = 'לעבד'), 'le''abed', 'en');
''',

  // all forms of 'to write'
  '''
insert into verb (stem_id, hebrew, nikkud, binyan, person, plurality, form) values 
((select id from stem where hebrew = 'כתב'), 'לכתוב', 'לִכְתוֹב', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'כתב'), 'כותב', 'כּוֹתֵב', 'paal', 'none', 'singularMasc', 'present'),
((select id from stem where hebrew = 'כתב'), 'כותבת', 'כּוֹתֶבֶת', 'paal', 'none', 'singularFem', 'present'),
((select id from stem where hebrew = 'כתב'), 'כותבים', 'כּוֹתְבִים', 'paal', 'none', 'pluralMasc', 'present'),
((select id from stem where hebrew = 'כתב'), 'כותבות', 'כּוֹתְבוֹת', 'paal', 'none', 'pluralFem', 'present'),
((select id from stem where hebrew = 'כתב'), 'כתבתי', 'כָּתַבְתִּי', 'paal', 'first', 'singular', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתבת', 'כָּתַבְתָּ', 'paal', 'second', 'singularMasc', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתבת', 'כָּתַבְתְּ', 'paal', 'second', 'singularFem', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתב', 'כָּתַב', 'paal', 'third', 'singularMasc', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתבה', 'כָּתְבָה', 'paal', 'third', 'singularFem', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתבנו', 'כָּתַבְנוּ', 'paal', 'first', 'plural', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתבתם', 'כְּתַבְתֶּם', 'paal', 'second', 'pluralMasc', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתבתן', 'כְּתַבְתֶּן', 'paal', 'second', 'pluralFem', 'past'),
((select id from stem where hebrew = 'כתב'), 'כתבו', 'כָּתְבוּ', 'paal', 'third', 'plural', 'past'),
((select id from stem where hebrew = 'כתב'), 'אכתוב', 'אֶכְתּוֹב', 'paal', 'first', 'singular', 'future'),
((select id from stem where hebrew = 'כתב'), 'תכתוב', 'תִּכְתּוֹב', 'paal', 'second', 'singularMasc', 'future'),
((select id from stem where hebrew = 'כתב'), 'תכתבי', 'תִּכְתְּבִי', 'paal', 'second', 'singularFem', 'future'),
((select id from stem where hebrew = 'כתב'), 'יכתוב', 'יִכְתּוֹב', 'paal', 'third', 'singularMasc', 'future'),
((select id from stem where hebrew = 'כתב'), 'תכתוב', 'תִּכְתּוֹב', 'paal', 'third', 'singularFem', 'future'),
((select id from stem where hebrew = 'כתב'), 'נכתוב', 'נִכְתּוֹב', 'paal', 'first', 'plural', 'future'),
((select id from stem where hebrew = 'כתב'), 'תכתבו', 'תִּכְתְּבוּ', 'paal', 'second', 'pluralMasc', 'future'),
((select id from stem where hebrew = 'כתב'), 'תכתבנה', 'תִּכְתֹּבְנָה', 'paal', 'second', 'pluralFem', 'future'),
((select id from stem where hebrew = 'כתב'), 'יכתבו', 'יִכְתְּבוּ', 'paal', 'third', 'pluralMasc', 'future'),
((select id from stem where hebrew = 'כתב'), 'תכתבנה', 'תִּכְתֹּבְנָה', 'paal', 'third', 'pluralFem', 'future'),
((select id from stem where hebrew = 'כתב'), 'כתוב', 'כְּתוֹב', 'paal', 'none', 'singularMasc', 'imperative'),
((select id from stem where hebrew = 'כתב'), 'כתבי', 'כִּתְבִי', 'paal', 'none', 'singularFem', 'imperative'),
((select id from stem where hebrew = 'כתב'), 'כתבו', 'כִּתְבוּ', 'paal', 'none', 'pluralMasc', 'imperative'),
((select id from stem where hebrew = 'כתב'), 'כתבנה', 'כְּתֹבְנָה', 'paal', 'none', 'pluralFem', 'imperative');
''',

  // all translations for 'to write' forms
  '''
insert into verb_translation (verb_id, value, lang) values
((select id from verb where hebrew = 'לכתוב'), 'to write', 'en'),
((select id from verb where hebrew = 'כותב'), 'writing', 'en'),
((select id from verb where hebrew = 'כותבת'), 'writing', 'en'),
((select id from verb where hebrew = 'כותבים'), 'writing', 'en'),
((select id from verb where hebrew = 'כותבות'), 'writing', 'en'),
((select id from verb where hebrew = 'כתבתי'), 'I wrote', 'en'),
((select id from verb where hebrew = 'כתבת'), 'you (m) wrote', 'en'),
((select id from verb where hebrew = 'כתבת'), 'you (f) wrote', 'en'),
((select id from verb where hebrew = 'כתב'), 'he wrote', 'en'),
((select id from verb where hebrew = 'כתבה'), 'she wrote', 'en'),
((select id from verb where hebrew = 'כתבנו'), 'we wrote', 'en'),
((select id from verb where hebrew = 'כתבתם'), 'you (pl.m) wrote', 'en'),
((select id from verb where hebrew = 'כתבתן'), 'you (pl.f) wrote', 'en'),
((select id from verb where hebrew = 'כתבו'), 'they wrote', 'en'),
((select id from verb where hebrew = 'אכתוב'), 'I will write', 'en'),
((select id from verb where hebrew = 'תכתוב'), 'you (m) will write', 'en'),
((select id from verb where hebrew = 'תכתבי'), 'you (f) will write', 'en'),
((select id from verb where hebrew = 'יכתוב'), 'he will write', 'en'),
((select id from verb where hebrew = 'תכתוב'), 'she will write', 'en'),
((select id from verb where hebrew = 'נכתוב'), 'we will write', 'en'),
((select id from verb where hebrew = 'תכתבו'), 'you (pl.m) will write', 'en'),
((select id from verb where hebrew = 'תכתבנה'), 'you (pl.f) will write', 'en'),
((select id from verb where hebrew = 'יכתבו'), 'they (m) will write', 'en'),
((select id from verb where hebrew = 'תכתבנה'), 'they (f) will write', 'en'),
((select id from verb where hebrew = 'כתוב'), 'write (m.s.)', 'en'),
((select id from verb where hebrew = 'כתבי'), 'write (f.s.)', 'en'),
((select id from verb where hebrew = 'כתבו'), 'write (pl.m.)', 'en'),
((select id from verb where hebrew = 'כתבנה'), 'write (pl.f.)', 'en'),
((select id from verb where hebrew = 'לכתוב'), 'писать', 'ru'),
((select id from verb where hebrew = 'כותב'), 'пишет', 'ru'),
((select id from verb where hebrew = 'כותבת'), 'пишет', 'ru'),
((select id from verb where hebrew = 'כותבים'), 'пишут', 'ru'),
((select id from verb where hebrew = 'כותבות'), 'пишут', 'ru'),
((select id from verb where hebrew = 'כתבתי'), 'я написал', 'ru'),
((select id from verb where hebrew = 'כתבת'), 'ты написал', 'ru'),
((select id from verb where hebrew = 'כתבת'), 'ты написала', 'ru'),
((select id from verb where hebrew = 'כתב'), 'он написал', 'ru'),
((select id from verb where hebrew = 'כתבה'), 'она написала', 'ru'),
((select id from verb where hebrew = 'כתבנו'), 'мы написали', 'ru'),
((select id from verb where hebrew = 'כתבתם'), 'вы (м.р.) написали', 'ru'),
((select id from verb where hebrew = 'כתבתן'), 'вы (ж.р.) написали', 'ru'),
((select id from verb where hebrew = 'כתבו'), 'они написали', 'ru'),
((select id from verb where hebrew = 'אכתוב'), 'я напишу', 'ru'),
((select id from verb where hebrew = 'תכתוב'), 'ты (м.р.) напишешь', 'ru'),
((select id from verb where hebrew = 'תכתבי'), 'ты (ж.р.) напишешь', 'ru'),
((select id from verb where hebrew = 'יכתוב'), 'он напишет', 'ru'),
((select id from verb where hebrew = 'תכתוב'), 'она напишет', 'ru'),
((select id from verb where hebrew = 'נכתוב'), 'мы напишем', 'ru'),
((select id from verb where hebrew = 'תכתבו'), 'вы (м.р.) напишете', 'ru'),
((select id from verb where hebrew = 'תכתבנה'), 'вы (ж.р.) напишете', 'ru'),
((select id from verb where hebrew = 'יכתבו'), 'они (м.р.) напишут', 'ru'),
((select id from verb where hebrew = 'תכתבנה'), 'они (ж.р.) напишут', 'ru'),
((select id from verb where hebrew = 'כתוב'), 'напиши (м.р.)', 'ru'),
((select id from verb where hebrew = 'כתבי'), 'напиши (ж.р.)', 'ru'),
((select id from verb where hebrew = 'כתבו'), 'напишите (м.р.)', 'ru'),
((select id from verb where hebrew = 'כתבנה'), 'напишите (ж.р.)', 'ru');
  ''',
  // all transliterations to 'to write'
  '''
insert into verb_transliteration (verb_id, value, lang) values
((select id from verb where hebrew = 'לכתוב'), 'лихтов', 'ru'),
((select id from verb where hebrew = 'כותב'), 'котев', 'ru'),
((select id from verb where hebrew = 'כותבת'), 'котевет', 'ru'),
((select id from verb where hebrew = 'כותבים'), 'котвим', 'ru'),
((select id from verb where hebrew = 'כותבות'), 'котвот', 'ru'),
((select id from verb where hebrew = 'כתבתי'), 'катавти', 'ru'),
((select id from verb where hebrew = 'כתבת'), 'катавта', 'ru'),
((select id from verb where hebrew = 'כתבת'), 'катавт', 'ru'),
((select id from verb where hebrew = 'כתב'), 'катав', 'ru'),
((select id from verb where hebrew = 'כתבה'), 'катва', 'ru'),
((select id from verb where hebrew = 'כתבנו'), 'катавну', 'ru'),
((select id from verb where hebrew = 'כתבתם'), 'катавтем', 'ru'),
((select id from verb where hebrew = 'כתבתן'), 'катавтен', 'ru'),
((select id from verb where hebrew = 'כתבו'), 'катву', 'ru'),
((select id from verb where hebrew = 'אכתוב'), 'эктов', 'ru'),
((select id from verb where hebrew = 'תכתוב'), 'тиктов', 'ru'),
((select id from verb where hebrew = 'תכתבי'), 'тиктави', 'ru'),
((select id from verb where hebrew = 'יכתוב'), 'иктов', 'ru'),
((select id from verb where hebrew = 'תכתוב'), 'тиктов', 'ru'),
((select id from verb where hebrew = 'נכתוב'), 'никтов', 'ru'),
((select id from verb where hebrew = 'תכתבו'), 'тиктавуу', 'ru'),
((select id from verb where hebrew = 'תכתבנה'), 'тиктавна', 'ru'),
((select id from verb where hebrew = 'יכתבו'), 'иктавуу', 'ru'),
((select id from verb where hebrew = 'תכתבנה'), 'тиктавна', 'ru'),
((select id from verb where hebrew = 'כתוב'), 'ктов', 'ru'),
((select id from verb where hebrew = 'כתבי'), 'ктиви', 'ru'),
((select id from verb where hebrew = 'כתבו'), 'ктивуу', 'ru'),
((select id from verb where hebrew = 'כתבנה'), 'ктивна', 'ru'),
((select id from verb where hebrew = 'לכתוב'), 'likhtov', 'en'),
((select id from verb where hebrew = 'כותב'), 'kotev', 'en'),
((select id from verb where hebrew = 'כותבת'), 'kotevet', 'en'),
((select id from verb where hebrew = 'כותבים'), 'kotvim', 'en'),
((select id from verb where hebrew = 'כותבות'), 'kotvot', 'en'),
((select id from verb where hebrew = 'כתבתי'), 'katavti', 'en'),
((select id from verb where hebrew = 'כתבת'), 'katavta', 'en'),
((select id from verb where hebrew = 'כתבת'), 'katavt', 'en'),
((select id from verb where hebrew = 'כתב'), 'katav', 'en'),
((select id from verb where hebrew = 'כתבה'), 'katva', 'en'),
((select id from verb where hebrew = 'כתבנו'), 'katavnu', 'en'),
((select id from verb where hebrew = 'כתבתם'), 'katavtem', 'en'),
((select id from verb where hebrew = 'כתבתן'), 'katavten', 'en'),
((select id from verb where hebrew = 'כתבו'), 'katvu', 'en'),
((select id from verb where hebrew = 'אכתוב'), 'ekhtov', 'en'),
((select id from verb where hebrew = 'תכתוב'), 'tikhtov', 'en'),
((select id from verb where hebrew = 'תכתבי'), 'tikhtavi', 'en'),
((select id from verb where hebrew = 'יכתוב'), 'yikhtov', 'en'),
((select id from verb where hebrew = 'תכתוב'), 'tikhtov', 'en'),
((select id from verb where hebrew = 'נכתוב'), 'nikhtov', 'en'),
((select id from verb where hebrew = 'תכתבו'), 'tikhtavu', 'en'),
((select id from verb where hebrew = 'תכתבנה'), 'tikhtavna', 'en'),
((select id from verb where hebrew = 'יכתבו'), 'yikhtavu', 'en'),
((select id from verb where hebrew = 'תכתבנה'), 'tikhtavna', 'en'),
((select id from verb where hebrew = 'כתוב'), 'ktov', 'en'),
((select id from verb where hebrew = 'כתבי'), 'ktivy', 'en'),
((select id from verb where hebrew = 'כתבו'), 'ktivu', 'en'),
((select id from verb where hebrew = 'כתבנה'), 'ktivna', 'en');
  ''',
  '''
insert into verb (stem_id, hebrew, nikkud, binyan, person, plurality, form) values 
((select id from stem where hebrew = 'אכל'), 'לאכול', 'לֶאֱכֹל', 'paal', 'none', 'none', 'infinitive'),
((select id from stem where hebrew = 'אכל'), 'אוכל', 'אוֹכֵל', 'paal', 'none', 'singularMasc', 'present'),
((select id from stem where hebrew = 'אכל'), 'אוכלת', 'אוֹכֶלֶת', 'paal', 'none', 'singularFem', 'present'),
((select id from stem where hebrew = 'אכל'), 'אוכלים', 'אוֹכְלִים', 'paal', 'none', 'pluralMasc', 'present'),
((select id from stem where hebrew = 'אכל'), 'אוכלות', 'אוֹכְלוֹת', 'paal', 'none', 'pluralFem', 'present'),
((select id from stem where hebrew = 'אכל'), 'אכלתי', 'אָכַלְתִּי', 'paal', 'first', 'singular', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכלת', 'אָכַלְתָּ', 'paal', 'second', 'singularMasc', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכלת', 'אָכַלְתְּ', 'paal', 'second', 'singularFem', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכל', 'אָכַל', 'paal', 'third', 'singularMasc', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכלה', 'אָכְלָה', 'paal', 'third', 'singularFem', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכלנו', 'אָכַלְנוּ', 'paal', 'first', 'plural', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכלתם', 'אָכַלְתֶּם', 'paal', 'second', 'pluralMasc', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכלתן', 'אָכַלְתֶּן', 'paal', 'second', 'pluralFem', 'past'),
((select id from stem where hebrew = 'אכל'), 'אכלו', 'אָכְלוּ', 'paal', 'third', 'plural', 'past'),
((select id from stem where hebrew = 'אכל'), 'אוכל', 'אֹכַל', 'paal', 'first', 'singular', 'future'),
((select id from stem where hebrew = 'אכל'), 'תאכל', 'תֹּאכַל', 'paal', 'second', 'singularMasc', 'future'),
((select id from stem where hebrew = 'אכל'), 'תאכלי', 'תֹּאכְלִי', 'paal', 'second', 'singularFem', 'future'),
((select id from stem where hebrew = 'אכל'), 'יאכל', 'יֹאכַל', 'paal', 'third', 'singularMasc', 'future'),
((select id from stem where hebrew = 'אכל'), 'תאכל', 'תֹּאכַל', 'paal', 'third', 'singularFem', 'future'),
((select id from stem where hebrew = 'אכל'), 'נאכל', 'נֹאכַל', 'paal', 'first', 'plural', 'future'),
((select id from stem where hebrew = 'אכל'), 'תאכלו', 'תֹּאכְלוּ', 'paal', 'second', 'pluralMasc', 'future'),
((select id from stem where hebrew = 'אכל'), 'תאכלנה', 'תֹּאכַלְנָה', 'paal', 'second', 'pluralFem', 'future'),
((select id from stem where hebrew = 'אכל'), 'יאכלו', 'יֹאכְלוּ', 'paal', 'third', 'pluralMasc', 'future'),
((select id from stem where hebrew = 'אכל'), 'תאכלנה', 'תֹּאכַלְנָה', 'paal', 'third', 'pluralFem', 'future'),
((select id from stem where hebrew = 'אכל'), 'אכול', 'אֱכֹל', 'paal', 'none', 'singularMasc', 'imperative'),
((select id from stem where hebrew = 'אכל'), 'אכלי', 'אִכְלִי', 'paal', 'none', 'singularFem', 'imperative'),
((select id from stem where hebrew = 'אכל'), 'אכלו', 'אִכְלוּ', 'paal', 'none', 'pluralMasc', 'imperative'),
((select id from stem where hebrew = 'אכל'), 'אכלנה', 'אֱכֹלְנָה', 'paal', 'none', 'pluralFem', 'imperative');
  ''',
  '''
insert into verb_translation (verb_id, value, lang) values
((select id from verb where hebrew = 'לאכול'), 'to eat', 'en'),
((select id from verb where hebrew = 'אוכל'), 'eating', 'en'),
((select id from verb where hebrew = 'אוכלת'), 'eating', 'en'),
((select id from verb where hebrew = 'אוכלים'), 'eating', 'en'),
((select id from verb where hebrew = 'אוכלות'), 'eating', 'en'),
((select id from verb where hebrew = 'אכלתי'), 'I ate', 'en'),
((select id from verb where hebrew = 'אכלת'), 'you (m) ate', 'en'),
((select id from verb where hebrew = 'אכלת'), 'you (f) ate', 'en'),
((select id from verb where hebrew = 'אכל'), 'he ate', 'en'),
((select id from verb where hebrew = 'אכלה'), 'she ate', 'en'),
((select id from verb where hebrew = 'אכלנו'), 'we ate', 'en'),
((select id from verb where hebrew = 'אכלתם'), 'you (pl.m) ate', 'en'),
((select id from verb where hebrew = 'אכלתן'), 'you (pl.f) ate', 'en'),
((select id from verb where hebrew = 'אכלו'), 'they ate', 'en'),
((select id from verb where hebrew = 'אוכל'), 'I will eat', 'en'),
((select id from verb where hebrew = 'תאכל'), 'you (m) will eat', 'en'),
((select id from verb where hebrew = 'תאכלי'), 'you (f) will eat', 'en'),
((select id from verb where hebrew = 'יאכל'), 'he will eat', 'en'),
((select id from verb where hebrew = 'תאכל'), 'she will eat', 'en'),
((select id from verb where hebrew = 'נאכל'), 'we will eat', 'en'),
((select id from verb where hebrew = 'תאכלו'), 'you (pl.m) will eat', 'en'),
((select id from verb where hebrew = 'תאכלנה'), 'you (pl.f) will eat', 'en'),
((select id from verb where hebrew = 'יאכלו'), 'they (m) will eat', 'en'),
((select id from verb where hebrew = 'תאכלנה'), 'they (f) will eat', 'en'),
((select id from verb where hebrew = 'אכול'), 'eat (m.s.)', 'en'),
((select id from verb where hebrew = 'אכלי'), 'eat (f.s.)', 'en'),
((select id from verb where hebrew = 'אכלו'), 'eat (pl.m.)', 'en'),
((select id from verb where hebrew = 'אכלנה'), 'eat (pl.f.)', 'en');
''',
  '''
insert into verb_translation (verb_id, value, lang) values
((select id from verb where hebrew = 'לאכול'), 'есть', 'ru'),
((select id from verb where hebrew = 'אוכל'), 'ест', 'ru'),
((select id from verb where hebrew = 'אוכלת'), 'ест', 'ru'),
((select id from verb where hebrew = 'אוכלים'), 'едят', 'ru'),
((select id from verb where hebrew = 'אוכלות'), 'едят', 'ru'),
((select id from verb where hebrew = 'אכלתי'), 'я ел', 'ru'),
((select id from verb where hebrew = 'אכלת'), 'ты ел', 'ru'),
((select id from verb where hebrew = 'אכלת'), 'ты ела', 'ru'),
((select id from verb where hebrew = 'אכל'), 'он ел', 'ru'),
((select id from verb where hebrew = 'אכלה'), 'она ела', 'ru'),
((select id from verb where hebrew = 'אכלנו'), 'мы ели', 'ru'),
((select id from verb where hebrew = 'אכלתם'), 'вы (м.р.) ели', 'ru'),
((select id from verb where hebrew = 'אכלתן'), 'вы (ж.р.) ели', 'ru'),
((select id from verb where hebrew = 'אכלו'), 'они ели', 'ru'),
((select id from verb where hebrew = 'אוכל'), 'я буду есть', 'ru'),
((select id from verb where hebrew = 'תאכל'), 'ты (м.р.) будешь есть', 'ru'),
((select id from verb where hebrew = 'תאכלי'), 'ты (ж.р.) будешь есть', 'ru'),
((select id from verb where hebrew = 'יאכל'), 'он будет есть', 'ru'),
((select id from verb where hebrew = 'תאכל'), 'она будет есть', 'ru'),
((select id from verb where hebrew = 'נאכל'), 'мы будем есть', 'ru'),
((select id from verb where hebrew = 'תאכלו'), 'вы (м.р.) будете есть', 'ru'),
((select id from verb where hebrew = 'תאכלנה'), 'вы (ж.р.) будете есть', 'ru'),
((select id from verb where hebrew = 'יאכלו'), 'они (м.р.) будут есть', 'ru'),
((select id from verb where hebrew = 'תאכלנה'), 'они (ж.р.) будут есть', 'ru'),
((select id from verb where hebrew = 'אכול'), 'ешь (м.р.)', 'ru'),
((select id from verb where hebrew = 'אכלי'), 'ешь (ж.р.)', 'ru'),
((select id from verb where hebrew = 'אכלו'), 'ешьте (м.р.)', 'ru'),
((select id from verb where hebrew = 'אכלנה'), 'ешьте (ж.р.)', 'ru');
  ''',
  '''
insert into verb_transliteration (verb_id, value, lang) values
((select id from verb where hebrew = 'לאכול'), 'леэхоль', 'ru'),
((select id from verb where hebrew = 'אוכל'), 'охель', 'ru'),
((select id from verb where hebrew = 'אוכלת'), 'охелет', 'ru'),
((select id from verb where hebrew = 'אוכלים'), 'охлим', 'ru'),
((select id from verb where hebrew = 'אוכלות'), 'охлот', 'ru'),
((select id from verb where hebrew = 'אכלתי'), 'ахальти', 'ru'),
((select id from verb where hebrew = 'אכלת'), 'ахальта', 'ru'),
((select id from verb where hebrew = 'אכלת'), 'ахальт', 'ru'),
((select id from verb where hebrew = 'אכל'), 'ахаль', 'ru'),
((select id from verb where hebrew = 'אכלה'), 'ахла', 'ru'),
((select id from verb where hebrew = 'אכלנו'), 'ахальну', 'ru'),
((select id from verb where hebrew = 'אכלתם'), 'ахальтем', 'ru'),
((select id from verb where hebrew = 'אכלתן'), 'ахальтен', 'ru'),
((select id from verb where hebrew = 'אכלו'), 'ахлу', 'ru'),
((select id from verb where hebrew = 'אוכל'), 'охаль', 'ru'),
((select id from verb where hebrew = 'תאכל'), 'тохаль', 'ru'),
((select id from verb where hebrew = 'תאכלי'), 'тохли', 'ru'),
((select id from verb where hebrew = 'יאכל'), 'йохаль', 'ru'),
((select id from verb where hebrew = 'תאכל'), 'тохаль', 'ru'),
((select id from verb where hebrew = 'נאכל'), 'нохаль', 'ru'),
((select id from verb where hebrew = 'תאכלו'), 'тохлу', 'ru'),
((select id from verb where hebrew = 'תאכלנה'), 'тохальна', 'ru'),
((select id from verb where hebrew = 'יאכלו'), 'йохлу', 'ru'),
((select id from verb where hebrew = 'תאכלנה'), 'тохальна', 'ru'),
((select id from verb where hebrew = 'אכול'), 'эхоль', 'ru'),
((select id from verb where hebrew = 'אכלי'), 'эхли', 'ru'),
((select id from verb where hebrew = 'אכלו'), 'эхлу', 'ru'),
((select id from verb where hebrew = 'אכלנה'), 'эхальна', 'ru');
''',
  '''
insert into verb_transliteration (verb_id, value, lang) values
((select id from verb where hebrew = 'לאכול'), 'le’echol', 'en'),
((select id from verb where hebrew = 'אוכל'), 'ochel', 'en'),
((select id from verb where hebrew = 'אוכלת'), 'ochelet', 'en'),
((select id from verb where hebrew = 'אוכלים'), 'ochlim', 'en'),
((select id from verb where hebrew = 'אוכלות'), 'ochlot', 'en'),
((select id from verb where hebrew = 'אכלתי'), 'achalti', 'en'),
((select id from verb where hebrew = 'אכלת'), 'achalta', 'en'),
((select id from verb where hebrew = 'אכלת'), 'achalt', 'en'),
((select id from verb where hebrew = 'אכל'), 'achal', 'en'),
((select id from verb where hebrew = 'אכלה'), 'achla', 'en'),
((select id from verb where hebrew = 'אכלנו'), 'achalnu', 'en'),
((select id from verb where hebrew = 'אכלתם'), 'achaltam', 'en'),
((select id from verb where hebrew = 'אכלתן'), 'achalten', 'en'),
((select id from verb where hebrew = 'אכלו'), 'achlu', 'en'),
((select id from verb where hebrew = 'אוכל'), 'ochal', 'en'),
((select id from verb where hebrew = 'תאכל'), 'tochal', 'en'),
((select id from verb where hebrew = 'תאכלי'), 'tochli', 'en'),
((select id from verb where hebrew = 'יאכל'), 'yochal', 'en'),
((select id from verb where hebrew = 'תאכל'), 'tochal', 'en'),
((select id from verb where hebrew = 'נאכל'), 'nochal', 'en'),
((select id from verb where hebrew = 'תאכלו'), 'tochlu', 'en'),
((select id from verb where hebrew = 'תאכלנה'), 'tochalna', 'en'),
((select id from verb where hebrew = 'יאכלו'), 'yochlu', 'en'),
((select id from verb where hebrew = 'תאכלנה'), 'tochalna', 'en'),
((select id from verb where hebrew = 'אכול'), 'echol', 'en'),
((select id from verb where hebrew = 'אכלי'), 'echli', 'en'),
((select id from verb where hebrew = 'אכלו'), 'echlu', 'en'),
((select id from verb where hebrew = 'אכלנה'), 'echalna', 'en');
  ''',
  '''
insert into verb_sample (verb_id, value, liked) values
((select id from verb where hebrew = 'לאכול'), 'foo sample1', false),
((select id from verb where hebrew = 'לאכול'), 'foo sample2', true);
  ''',
  '''
insert into verb_sample_translation (sample_id, value, lang) values
((select id from verb_sample where value = 'foo sample1'), 'foo sample translation 1', 'en'),
((select id from verb_sample where value = 'foo sample2'), 'foo sample translation 2', 'en');
  '''
];
