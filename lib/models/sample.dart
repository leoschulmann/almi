import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';

class Sample {
  final int id;
  final int verbId;
  final String value;
  final bool isLiked;
  final List<SampleTranslation> translations;

  const Sample(this.id, this.verbId, this.value, this.isLiked, this.translations);
}

class SampleTranslation {
  final int sampleId;
  final String value;
  final ForeignLang lang;

  const SampleTranslation(this.sampleId, this.value, this.lang);
}
