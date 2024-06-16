import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:ani_lo_medaber_ivrit/widgets/likable_text_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerbVariantSamplesScreen extends ConsumerStatefulWidget {
  const VerbVariantSamplesScreen({super.key, required this.verb});

  final Verb verb;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _VerbVariantSamplesScreenState();
  }
}

class _VerbVariantSamplesScreenState extends ConsumerState<VerbVariantSamplesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children;

    if (widget.verb.samples.isEmpty) {
      children = [const Text('n/a')];
    } else {
      children = widget.verb.samples
          .map((s) =>
              LikableTextSample(sampleId: s.id, value: s.value, translation: s.translations[0].value, liked: s.isLiked))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.verb.valueHebrew[HebrewLang.simple]!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [...children],
        ),
      ),
    );
  }
}
