import 'dart:math';

import 'package:ani_lo_medaber_ivrit/db/verb_dao.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/providers/tab_screen_provider.dart';
import 'package:ani_lo_medaber_ivrit/screens/stem_details_screen.dart';
import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StemContainer extends ConsumerWidget {
  const StemContainer({super.key, required this.stem});

  final Stem stem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () async {
          VerbDAO.getVerbsForStem(stem).then(
            (verbs) => ref.read(currentScreenProvider.notifier).state = StemDetailsScreen(verbs: verbs, stem: stem),
          );
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ש', style: theme.bodyLarge),
              const SizedBox(width: 12),
              SizedBox(
                height: 100,
                child: AutoSizeText(
                  stem.valueHebrew[HebrewLang.simple] ?? 'err',
                  maxLines: 1,
                  style: StyleHelper.getHebrewNoto(theme),
                ),
              ),
              const SizedBox(width: 12),
              Text('(${Random().nextInt(10)})', style: theme.bodyLarge)
            ],
          ),
        ),
      ),
    );
  }
}
