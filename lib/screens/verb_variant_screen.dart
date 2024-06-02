import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/binyan.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:ani_lo_medaber_ivrit/models/verb_info.dart';
import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:ani_lo_medaber_ivrit/widgets/verb_card.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerbVariantScreen extends ConsumerWidget {
  VerbVariantScreen({required this.verbs, required this.stem, super.key})
      : infinitive = _getVerb(VerbForm.infinitive, GrammaticalPerson.none, Plurality.none, verbs),
        presentMasc = _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.singularMasc, verbs),
        presentFem = _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.singularFem, verbs),
        presentMascPl = _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.pluralMasc, verbs),
        presentFemPl = _getVerb(VerbForm.present, GrammaticalPerson.none, Plurality.pluralFem, verbs),
        pastFirst = _getVerb(VerbForm.past, GrammaticalPerson.first, Plurality.singular, verbs),
        pastFirstPl = _getVerb(VerbForm.past, GrammaticalPerson.first, Plurality.plural, verbs),
        pastSecondMasc = _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.singularMasc, verbs),
        pastSecondFem = _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.singularFem, verbs),
        pastSecondMascPl = _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.pluralMasc, verbs),
        pastSecondFemPl = _getVerb(VerbForm.past, GrammaticalPerson.second, Plurality.pluralFem, verbs),
        pastThirdMasc = _getVerb(VerbForm.past, GrammaticalPerson.third, Plurality.singularMasc, verbs),
        pastThirdFem = _getVerb(VerbForm.past, GrammaticalPerson.third, Plurality.singularFem, verbs),
        pastThirdPl = _getVerb(VerbForm.past, GrammaticalPerson.third, Plurality.plural, verbs),
        futureFirst = _getVerb(VerbForm.future, GrammaticalPerson.first, Plurality.singular, verbs),
        futureFirstPl = _getVerb(VerbForm.future, GrammaticalPerson.first, Plurality.plural, verbs),
        futureSecondMasc = _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularMasc, verbs),
        futureSecondFem = _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularFem, verbs),
        futureSecondMascPl = _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.pluralMasc, verbs),
        futureSecondFemPl = _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.pluralFem, verbs),
        futureThirdMasc = _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularMasc, verbs),
        futureThirdFem = _getVerb(VerbForm.future, GrammaticalPerson.second, Plurality.singularFem, verbs),
        futureThirdPl = _getVerb(VerbForm.future, GrammaticalPerson.third, Plurality.pluralMasc, verbs),
        imperativeMasc = _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.singularFem, verbs),
        imperativeFem = _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.singularMasc, verbs),
        imperativeMascPl = _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.pluralFem, verbs),
        imperativeFemPl = _getVerb(VerbForm.imperative, GrammaticalPerson.none, Plurality.pluralMasc, verbs);

  final List<Verb> verbs;
  final Stem stem;

  final Verb infinitive;
  final Verb presentMasc;
  final Verb presentFem;
  final Verb presentMascPl;
  final Verb presentFemPl;
  final Verb pastFirst;
  final Verb pastFirstPl;
  final Verb pastSecondMasc;
  final Verb pastSecondFem;
  final Verb pastSecondMascPl;
  final Verb pastSecondFemPl;
  final Verb pastThirdMasc;
  final Verb pastThirdFem;
  final Verb pastThirdPl;
  final Verb futureFirst;
  final Verb futureFirstPl;
  final Verb futureSecondMasc;
  final Verb futureSecondFem;
  final Verb futureSecondMascPl;
  final Verb futureSecondFemPl;
  final Verb futureThirdMasc;
  final Verb futureThirdFem;
  final Verb futureThirdPl;
  final Verb imperativeMasc;
  final Verb imperativeFem;
  final Verb imperativeMascPl;
  final Verb imperativeFemPl;

  static Verb emptyPlaceholder = Verb(
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("all verbs"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Text('Infinitive', style: StyleHelper.getItalicLatin(theme.titleMedium!)),
              initiallyExpanded: true,
              children: [
                VerbCard(
                    icon: const Icon(Icons.ac_unit, color: Colors.red),
                    hebrew: infinitive.valueHebrew[HebrewLang.simple]!,
                    nikkud: infinitive.valueHebrew[HebrewLang.nikkud]!,
                    transliteration: infinitive.transliteration[ForeignLang.en]!)
              ],
            ),
            ExpansionTile(
                title: Text('Present', style: StyleHelper.getItalicLatin(theme.titleMedium!)),
                initiallyExpanded: true,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.person, color: Colors.blue),
                            hebrew: presentMasc.valueHebrew[HebrewLang.simple]!,
                            nikkud: presentMasc.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: presentMasc.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.person, color: Colors.pink),
                            hebrew: presentFem.valueHebrew[HebrewLang.simple]!,
                            nikkud: presentFem.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: presentFem.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: presentMascPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: presentMascPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: presentMascPl.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                            hebrew: presentFemPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: presentFemPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: presentFemPl.transliteration[ForeignLang.en]!),
                      )
                    ],
                  )
                ]),
            ExpansionTile(
                title: Text('Past', style: StyleHelper.getItalicLatin(theme.titleMedium!)),
                initiallyExpanded: true,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.person, color: Colors.blue),
                            hebrew: pastFirst.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastFirst.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastFirst.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.person, color: Colors.pink),
                            hebrew: pastFirstPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastFirstPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastFirstPl.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: pastSecondMasc.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastSecondMasc.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastSecondMasc.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                            hebrew: pastSecondFem.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastSecondFem.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastSecondFem.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: pastSecondMascPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastSecondMascPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastSecondMascPl.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                            hebrew: pastSecondFemPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastSecondFemPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastSecondFemPl.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: pastThirdMasc.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastThirdMasc.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastThirdMasc.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                            hebrew: pastThirdFem.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastThirdFem.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastThirdFem.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: pastThirdPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: pastThirdPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: pastThirdPl.transliteration[ForeignLang.en]!),
                      ),
                    ],
                  )
                ]),
            ExpansionTile(
                title: Text('Future', style: StyleHelper.getItalicLatin(theme.titleMedium!)),
                initiallyExpanded: true,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.person, color: Colors.blue),
                            hebrew: futureFirst.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureFirst.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureFirst.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.person, color: Colors.pink),
                            hebrew: futureFirstPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureFirstPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureFirstPl.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: futureSecondMasc.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureSecondMasc.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureSecondMasc.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                            hebrew: futureSecondFem.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureSecondFem.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureSecondFem.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: futureSecondMascPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureSecondMascPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureSecondMascPl.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                            hebrew: futureSecondFemPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureSecondFemPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureSecondFemPl.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: futureThirdMasc.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureThirdMasc.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureThirdMasc.transliteration[ForeignLang.en]!),
                      ),
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                            hebrew: futureThirdFem.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureThirdFem.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureThirdFem.transliteration[ForeignLang.en]!),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                            icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                            hebrew: futureThirdPl.valueHebrew[HebrewLang.simple]!,
                            nikkud: futureThirdPl.valueHebrew[HebrewLang.nikkud]!,
                            transliteration: futureThirdPl.transliteration[ForeignLang.en]!),
                      ),
                    ],
                  )
                ]),
            ExpansionTile(
              title: Text('Imperative', style: StyleHelper.getItalicLatin(theme.titleMedium!)),
              initiallyExpanded: true,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: VerbCard(
                          icon: const Icon(Icons.person, color: Colors.blue),
                          hebrew: imperativeMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: imperativeMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: imperativeMasc.transliteration[ForeignLang.en]!),
                    ),
                    Expanded(
                      child: VerbCard(
                          icon: const Icon(Icons.person, color: Colors.pink),
                          hebrew: imperativeFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: imperativeFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: imperativeFem.transliteration[ForeignLang.en]!),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: VerbCard(
                          icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.blue),
                          hebrew: imperativeMascPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: imperativeMascPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: imperativeMascPl.transliteration[ForeignLang.en]!),
                    ),
                    Expanded(
                      child: VerbCard(
                          icon: const Icon(Icons.supervised_user_circle_sharp, color: Colors.pink),
                          hebrew: imperativeFemPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: imperativeFemPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: imperativeFemPl.transliteration[ForeignLang.en]!),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Verb _getVerb(VerbForm form, GrammaticalPerson person, Plurality plurality, List<Verb> verbs) {
    Verb? firstOrNull =
        verbs.where((e) => e.info.form == form && e.info.plurality == plurality && e.info.person == person).firstOrNull;

    if(firstOrNull == null) {
      print('not found $form $person $plurality');
    }
    return firstOrNull ??= emptyPlaceholder;
  }
}
