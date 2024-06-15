import 'package:ani_lo_medaber_ivrit/db/verb_dao.dart';
import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:ani_lo_medaber_ivrit/providers/tab_screen_provider.dart';
import 'package:ani_lo_medaber_ivrit/screens/verb_content_screen.dart';
import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StemContentCard extends ConsumerWidget {
  const StemContentCard({super.key, required this.verb});

  final Verb verb;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme theme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () async {
        VerbDAO.getAllVerbForms(verb.stem, verb.binyan).then(
          (verbs) => ref.read(currentScreenProvider.notifier).state = VerbContentScreen(stem: verb.stem, verbs: verbs),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(verb.binyan.icon, color: verb.binyan.color),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: AutoSizeText(verb.valueHebrew[HebrewLang.simple]!,
                      style: StyleHelper.getHebrewNotoAutoSize(theme), maxLines: 1),
                ),
                Text('(${verb.transliteration[ForeignLang.en]})', style: StyleHelper.getItalicLatin(theme.titleSmall!))
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text('${verb.meanings[ForeignLang.en]?.join(', ')}', style: StyleHelper.getItalicLatin(theme.titleLarge!)),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    );
  }
}
