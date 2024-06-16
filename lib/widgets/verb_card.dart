import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:ani_lo_medaber_ivrit/providers/tab_screen_provider.dart';
import 'package:ani_lo_medaber_ivrit/screens/verb_variant_samples_screen.dart';
import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerbCard extends ConsumerWidget {
  final Icon icon;
  final Verb verb;

  const VerbCard({
    super.key,
    required this.verb,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        ref.read(currentScreenProvider.notifier).state = VerbVariantSamplesScreen(verb: verb);
      },
      child: Card(
        margin: const EdgeInsets.all(1),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Add padding to the card for better spacing
          child: Row(
            children: [
              icon,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      child: AutoSizeText(
                        verb.valueHebrew[HebrewLang.simple]!,
                        maxLines: 1,
                        style: StyleHelper.getHebrewNotoAutoSize(theme),
                      ),
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      height: 15,
                      child: AutoSizeText(
                        '($verb.transliteration[ForeignLang.en]!)',
                        style: StyleHelper.getItalicLatin(theme.titleMedium!),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
