import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerbVariantScreen extends ConsumerWidget {
  const VerbVariantScreen({required this.verbs, required this.stem, super.key});

  final List<Verb> verbs;
  final Stem stem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("all verbs"),
      ),
      body: Column(children: [
        ...verbs.map(
          (e) => Text(
            '${e.info.person.name} ${e.info.form.name} ${e.info.plurality.name} ${e.valueHebrew[HebrewLang.simple]} '
            '(${e.transliteration[ForeignLang.en]}) : ${e.meanings[ForeignLang.en]!.join(', ')}',
            style: theme.labelMedium,
          ),
        )
      ]),
    );
  }
}
