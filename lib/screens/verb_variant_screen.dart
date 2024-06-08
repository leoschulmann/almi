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

import '../data/flutter_icon.dart';

//todo refactor
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

    Brightness brTheme = Theme.of(context).brightness;

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
                  // icon: const Icon(FlutterIconAlmi.inf_o, color: Colors.red),
                  icon: FlutterIconAlmi.icon(plurality: Plurality.none, person: GrammaticalPerson.none, theme: brTheme),
                  hebrew: infinitive.valueHebrew[HebrewLang.simple]!,
                  nikkud: infinitive.valueHebrew[HebrewLang.nikkud]!,
                  transliteration: infinitive.transliteration[ForeignLang.en]!,
                )
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
                          // icon: const Icon(FlutterIconAlmi.third_sing_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: presentMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: presentMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: presentMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_sing_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: presentFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: presentFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: presentFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_pl_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralMasc, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: presentMascPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: presentMascPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: presentMascPl.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_pl_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: presentFemPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: presentFemPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: presentFemPl.transliteration[ForeignLang.en]!,
                        ),
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
                          // icon: const Icon(FlutterIconAlmi.first_sing_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singular, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: pastFirst.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastFirst.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastFirst.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.first_pl_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: pastFirstPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastFirstPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastFirstPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_sing_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: pastSecondMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastSecondMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastSecondMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_sing_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: pastSecondFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastSecondFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastSecondFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_pl_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: pastSecondMascPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastSecondMascPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastSecondMascPl.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_pl_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: pastSecondFemPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastSecondFemPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastSecondFemPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_sing_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: pastThirdMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastThirdMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastThirdMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_sing_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: pastThirdFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastThirdFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastThirdFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_pl_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: pastThirdPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: pastThirdPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: pastThirdPl.transliteration[ForeignLang.en]!,
                        ),
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
                          // icon: const Icon(FlutterIconAlmi.first_sing_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singular, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: futureFirst.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureFirst.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureFirst.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.first_pl_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: futureFirstPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureFirstPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureFirstPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_sing_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: futureSecondMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureSecondMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureSecondMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_sing_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: futureSecondFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureSecondFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureSecondFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_pl_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: futureSecondMascPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureSecondMascPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureSecondMascPl.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.sec_pl_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: futureSecondFemPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureSecondFemPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureSecondFemPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_sing_masc_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: futureThirdMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureThirdMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureThirdMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_sing_fem_o, color: Colors.pink),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: futureThirdFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureThirdFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureThirdFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          // icon: const Icon(FlutterIconAlmi.third_pl_o, color: Colors.blue),
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: futureThirdPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: futureThirdPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: futureThirdPl.transliteration[ForeignLang.en]!,
                        ),
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
                        // icon: const Icon(FlutterIconAlmi.sec_sing_masc_o, color: Colors.blue),
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.singularMasc, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: imperativeMasc.valueHebrew[HebrewLang.simple]!,
                        nikkud: imperativeMasc.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: imperativeMasc.transliteration[ForeignLang.en]!,
                      ),
                    ),
                    Expanded(
                      child: VerbCard(
                        // icon: const Icon(FlutterIconAlmi.sec_sing_fem_o, color: Colors.pink),
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.singularFem, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: imperativeFem.valueHebrew[HebrewLang.simple]!,
                        nikkud: imperativeFem.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: imperativeFem.transliteration[ForeignLang.en]!,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: VerbCard(
                        // icon: const Icon(FlutterIconAlmi.sec_pl_masc_o, color: Colors.blue),
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.pluralMasc, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: imperativeMascPl.valueHebrew[HebrewLang.simple]!,
                        nikkud: imperativeMascPl.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: imperativeMascPl.transliteration[ForeignLang.en]!,
                      ),
                    ),
                    Expanded(
                      child: VerbCard(
                        // icon: const Icon(FlutterIconAlmi.sec_pl_fem_o, color: Colors.pink),
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.pluralFem, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: imperativeFemPl.valueHebrew[HebrewLang.simple]!,
                        nikkud: imperativeFemPl.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: imperativeFemPl.transliteration[ForeignLang.en]!,
                      ),
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

    if (firstOrNull == null) {
      print('not found $form $person $plurality');
    }
    return firstOrNull ??= emptyPlaceholder;
  }
}
