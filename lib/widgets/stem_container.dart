import 'package:ani_lo_medaber_ivrit/db/verb_dao.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:ani_lo_medaber_ivrit/screens/stem_details_screen.dart';
import 'package:ani_lo_medaber_ivrit/styles/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StemContainer extends StatelessWidget {
  const StemContainer({super.key, required this.stem});

  final Stem stem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        List<Verb> verbs = await VerbDAO.getVerbForStem(stem);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StemDetailsScreen(verbs: verbs),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white60, Colors.white38], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  style: noto,
                  stem.valueHebrew[HebrewLang.simple]!,
                  maxLines: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
