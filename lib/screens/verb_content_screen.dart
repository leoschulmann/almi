import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/complete_verb.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/models/verb_info.dart';
import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:ani_lo_medaber_ivrit/widgets/verb_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/flutter_icon.dart';

class VerbContentScreen extends ConsumerWidget {
  VerbContentScreen({required verbs, required this.stem, super.key}) : cv = CompleteVerb(verbs);

  final CompleteVerb cv;
  final Stem stem;

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
                  icon: FlutterIconAlmi.icon(plurality: Plurality.none, person: GrammaticalPerson.none, theme: brTheme),
                  hebrew: cv.infinitive.valueHebrew[HebrewLang.simple]!,
                  nikkud: cv.infinitive.valueHebrew[HebrewLang.nikkud]!,
                  transliteration: cv.infinitive.transliteration[ForeignLang.en]!,
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
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: cv.presentMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.presentMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.presentMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: cv.presentFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.presentFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.presentFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralMasc, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: cv.presentMascPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.presentMascPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.presentMascPl.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.none, theme: brTheme),
                          hebrew: cv.presentFemPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.presentFemPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.presentFemPl.transliteration[ForeignLang.en]!,
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
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singular, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: cv.pastFirst.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastFirst.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastFirst.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: cv.pastFirstPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastFirstPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastFirstPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.pastSecondMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastSecondMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastSecondMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.pastSecondFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastSecondFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastSecondFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.pastSecondMascPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastSecondMascPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastSecondMascPl.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.pastSecondFemPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastSecondFemPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastSecondFemPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: cv.pastThirdMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastThirdMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastThirdMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: cv.pastThirdFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastThirdFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastThirdFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: cv.pastThirdPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.pastThirdPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.pastThirdPl.transliteration[ForeignLang.en]!,
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
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singular, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: cv.futureFirst.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureFirst.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureFirst.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.first, theme: brTheme),
                          hebrew: cv.futureFirstPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureFirstPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureFirstPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.futureSecondMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureSecondMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureSecondMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.futureSecondFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureSecondFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureSecondFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralMasc, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.futureSecondMascPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureSecondMascPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureSecondMascPl.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.second, theme: brTheme),
                          hebrew: cv.futureSecondFemPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureSecondFemPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureSecondFemPl.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularMasc, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: cv.futureThirdMasc.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureThirdMasc.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureThirdMasc.transliteration[ForeignLang.en]!,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: cv.futureThirdFem.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureThirdFem.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureThirdFem.transliteration[ForeignLang.en]!,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.third, theme: brTheme),
                          hebrew: cv.futureThirdPl.valueHebrew[HebrewLang.simple]!,
                          nikkud: cv.futureThirdPl.valueHebrew[HebrewLang.nikkud]!,
                          transliteration: cv.futureThirdPl.transliteration[ForeignLang.en]!,
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
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.singularMasc, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: cv.imperativeMasc.valueHebrew[HebrewLang.simple]!,
                        nikkud: cv.imperativeMasc.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: cv.imperativeMasc.transliteration[ForeignLang.en]!,
                      ),
                    ),
                    Expanded(
                      child: VerbCard(
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.singularFem, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: cv.imperativeFem.valueHebrew[HebrewLang.simple]!,
                        nikkud: cv.imperativeFem.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: cv.imperativeFem.transliteration[ForeignLang.en]!,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: VerbCard(
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.pluralMasc, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: cv.imperativeMascPl.valueHebrew[HebrewLang.simple]!,
                        nikkud: cv.imperativeMascPl.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: cv.imperativeMascPl.transliteration[ForeignLang.en]!,
                      ),
                    ),
                    Expanded(
                      child: VerbCard(
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.pluralFem, person: GrammaticalPerson.none, theme: brTheme),
                        hebrew: cv.imperativeFemPl.valueHebrew[HebrewLang.simple]!,
                        nikkud: cv.imperativeFemPl.valueHebrew[HebrewLang.nikkud]!,
                        transliteration: cv.imperativeFemPl.transliteration[ForeignLang.en]!,
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
}
