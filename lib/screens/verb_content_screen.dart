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
                  verb: cv.infinitive,
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
                          verb: cv.presentMasc,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.none, theme: brTheme),
                          verb: cv.presentFem,
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
                          verb: cv.presentMascPl,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.none, theme: brTheme),
                          verb: cv.presentFemPl,
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
                          verb: cv.pastFirst,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.first, theme: brTheme),
                          verb: cv.pastFirstPl,
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
                          verb: cv.pastSecondMasc,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.second, theme: brTheme),
                          verb: cv.pastSecondFem,
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
                          verb: cv.pastSecondMascPl,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.second, theme: brTheme),
                          verb: cv.pastSecondFemPl,
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
                          verb: cv.pastThirdMasc,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.third, theme: brTheme),
                          verb: cv.pastThirdFem,
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
                          verb: cv.pastThirdPl,
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
                          verb: cv.futureFirst,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.plural, person: GrammaticalPerson.first, theme: brTheme),
                          verb: cv.futureFirstPl,
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
                          verb: cv.futureSecondMasc,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.second, theme: brTheme),
                          verb: cv.futureSecondFem,
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
                          verb: cv.futureSecondMascPl,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.pluralFem, person: GrammaticalPerson.second, theme: brTheme),
                          verb: cv.futureSecondFemPl,
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
                          verb: cv.futureThirdMasc,
                        ),
                      ),
                      Expanded(
                        child: VerbCard(
                          icon: FlutterIconAlmi.icon(
                              plurality: Plurality.singularFem, person: GrammaticalPerson.third, theme: brTheme),
                          verb: cv.futureThirdFem,
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
                          verb: cv.futureThirdPl,
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
                        verb: cv.imperativeMasc,
                      ),
                    ),
                    Expanded(
                      child: VerbCard(
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.singularFem, person: GrammaticalPerson.none, theme: brTheme),
                        verb: cv.imperativeFem,
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
                        verb: cv.imperativeMascPl,
                      ),
                    ),
                    Expanded(
                      child: VerbCard(
                        icon: FlutterIconAlmi.icon(
                            plurality: Plurality.pluralFem, person: GrammaticalPerson.none, theme: brTheme),
                        verb: cv.imperativeFemPl,
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
