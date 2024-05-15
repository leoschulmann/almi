enum ForeignLang { en, ru }

ForeignLang parseForeignLang(String value) {
  switch (value.toLowerCase()) {
    case 'en':
      return ForeignLang.en;
    case 'ru':
      return ForeignLang.ru;
    default:
      throw ArgumentError('Unsupported Foreign Lang value: $value');
  }
}
