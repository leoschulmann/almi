import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class VerbCard extends StatelessWidget {
  final Icon icon;
  final String hebrew;
  final String nikkud;
  final String transliteration;

  const VerbCard({
    super.key,
    required this.icon,
    required this.hebrew,
    required this.nikkud,
    required this.transliteration,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.all(1),
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
                      hebrew,
                      maxLines: 1,
                      style: StyleHelper.getHebrewNotoAutoSize(theme),
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    height: 15,
                    child: AutoSizeText(
                      '($transliteration)',
                      style: StyleHelper.getItalicLatin(theme.titleMedium!),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
