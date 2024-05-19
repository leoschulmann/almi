import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class StemContainer extends StatelessWidget {
  const StemContainer({super.key, required this.stem});

  final Stem stem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white60, Colors.white38],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      height: 50,
      child: Row(
        children: [
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Icon(stem.binyan.icon, color: stem.binyan.color),
          ),
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
    );
  }
}
