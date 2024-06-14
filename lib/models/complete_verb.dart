import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/binyan.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';

import 'stem.dart';
import 'verb_info.dart';

class CompleteVerb {
  final Map<String, Verb> map;

  CompleteVerb._(this.map);

  factory CompleteVerb(List<Verb> allForms) {
    return CompleteVerb._(Map.of({
      'infinitive': _getVerb(VerbForm.infinitive, GrammaticalPerson.none, Plurality.none, allForms),
      'presentMasc': _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.singularMasc, allForms),
      'presentFem': _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.singularFem, allForms),
      'presentMascPl': _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.pluralMasc, allForms),
      'presentFemPl': _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.pluralFem, allForms),
      'pastFirst': _getVerb(VerbForm.past, GrammaticalPerson.first, Plurality.singular, allForms),
      'pastFirstPl': _getVerb(VerbForm.past, GrammaticalPerson.first, Plurality.plural, allForms),
      'pastSecondMasc': _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.singularMasc, allForms),
      'pastSecondFem': _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.singularFem, allForms),
      'pastSecondMascPl': _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.pluralMasc, allForms),
      'pastSecondFemPl': _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.pluralFem, allForms),
      'pastThirdMasc': _getVerb(VerbForm.past, GrammaticalPerson.third, Plurality.singularMasc, allForms),
      'pastThirdFem': _getVerb(VerbForm.past, GrammaticalPerson.third, Plurality.singularFem, allForms),
      'pastThirdPl': _getVerb(VerbForm.past, GrammaticalPerson.third, Plurality.plural, allForms),
      'futureFirst': _getVerb(VerbForm.future, GrammaticalPerson.first, Plurality.singular, allForms),
      'futureFirstPl': _getVerb(VerbForm.future, GrammaticalPerson.first, Plurality.plural, allForms),
      'futureSecondMasc': _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularMasc, allForms),
      'futureSecondFem': _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularFem, allForms),
      'futureSecondMascPl': _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.pluralMasc, allForms),
      'futureSecondFemPl': _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.pluralFem, allForms),
      'futureThirdMasc': _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularMasc, allForms),
      'futureThirdFem': _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularFem, allForms),
      'futureThirdPl': _getVerb(VerbForm.future, GrammaticalPerson.third, Plurality.pluralMasc, allForms),
      'imperativeMasc': _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.singularFem, allForms),
      'imperativeFem': _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.singularMasc, allForms),
      'imperativeMascPl': _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.pluralFem, allForms),
      'imperativeFemPl': _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.pluralMasc, allForms),
    }));
  }

  Verb get infinitive => map['infinitive'] ??= missingForm;
  Verb get presentMasc => map['presentMasc'] ??= missingForm;
  Verb get presentFem => map['presentFem'] ??= missingForm;
  Verb get presentMascPl => map['presentMascPl'] ??= missingForm;
  Verb get presentFemPl => map['presentFemPl'] ??= missingForm;
  Verb get pastFirst => map['pastFirst'] ??= missingForm;
  Verb get pastFirstPl => map['pastFirstPl'] ??= missingForm;
  Verb get pastSecondMasc => map['pastSecondMasc'] ??= missingForm;
  Verb get pastSecondFem => map['pastSecondFem'] ??= missingForm;
  Verb get pastSecondMascPl => map['pastSecondMascPl'] ??= missingForm;
  Verb get pastSecondFemPl => map['pastSecondFemPl'] ??= missingForm;
  Verb get pastThirdMasc => map['pastThirdMasc'] ??= missingForm;
  Verb get pastThirdFem => map['pastThirdFem'] ??= missingForm;
  Verb get pastThirdPl => map['pastThirdPl'] ??= missingForm;
  Verb get futureFirst => map['futureFirst'] ??= missingForm;
  Verb get futureFirstPl => map['futureFirstPl'] ??= missingForm;
  Verb get futureSecondMasc => map['futureSecondMasc'] ??= missingForm;
  Verb get futureSecondFem => map['futureSecondFem'] ??= missingForm;
  Verb get futureSecondMascPl => map['futureSecondMascPl'] ??= missingForm;
  Verb get futureSecondFemPl => map['futureSecondFemPl'] ??= missingForm;
  Verb get futureThirdMasc => map['futureThirdMasc'] ??= missingForm;
  Verb get futureThirdFem => map['futureThirdFem'] ??= missingForm;
  Verb get futureThirdPl => map['futureThirdPl'] ??= missingForm;
  Verb get imperativeMasc => map['imperativeMasc'] ??= missingForm;
  Verb get imperativeFem => map['imperativeFem'] ??= missingForm;
  Verb get imperativeMascPl => map['imperativeMascPl'] ??= missingForm;
  Verb get imperativeFemPl => map['imperativeFemPl'] ??= missingForm;


  static Verb missingForm = Verb(
    binyan: Binyan.paal,
    stem: Stem(id: -1, valueHebrew: {
      HebrewLang.simple: 'n/a',
      HebrewLang.nikkud: 'n/a'
    }, transliteration: {
      ForeignLang.en: 'n/a',
      ForeignLang.ru: 'n/a'
    }, meanings: {
      ForeignLang.en: ['n/a'],
      ForeignLang.ru: ['n/a']
    }),
    info: VerbInfo(GrammaticalPerson.none, Plurality.none, VerbForm.infinitive),
    samples: ['n/a'],
    valueHebrew: {HebrewLang.simple: 'n/a', HebrewLang.nikkud: 'n/a'},
    transliteration: {ForeignLang.en: 'n/a', ForeignLang.ru: 'n/a'},
    meanings: {
      ForeignLang.en: ['n/a'],
      ForeignLang.ru: ['n/a']
    },
  );

  //todo optimize
  static Verb _getVerb(VerbForm form, GrammaticalPerson person, Plurality plurality, List<Verb> source) {
    Verb? firstOrNull = source
        .where((e) => e.info.form == form && e.info.plurality == plurality && e.info.person == person)
        .firstOrNull;

    if (firstOrNull == null) {
      print('not found $form $person $plurality');
    }
    return firstOrNull ??= missingForm;
  }
}
