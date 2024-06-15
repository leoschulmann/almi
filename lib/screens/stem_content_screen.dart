import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:ani_lo_medaber_ivrit/widgets/stem_content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StemContentScreen extends ConsumerStatefulWidget {
  const StemContentScreen({super.key, required this.verbs, required this.stem});

  final List<Verb> verbs;
  final Stem stem;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StemContentScreenState();
  }
}

class _StemContentScreenState extends ConsumerState<StemContentScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.stem.valueHebrew[HebrewLang.simple]}'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Verbs', style: StyleHelper.getItalicLatin(theme.headlineLarge!)),
            ...widget.verbs.map((v) => StemContentCard(verb: v)),
            const SizedBox(height: 12),
            const Divider(height: 10),
            Text('Nouns', style: StyleHelper.getItalicLatin(theme.headlineLarge!)),
            const SizedBox(height: 12),
            const Divider(height: 10),
            Text('Adjectives', style: StyleHelper.getItalicLatin(theme.headlineLarge!)),
          ],
        ),
      ),
    );
  }
}
