import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/verb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StemDetailsScreen extends ConsumerStatefulWidget {
  const StemDetailsScreen({super.key, required this.verbs});

  final List<Verb> verbs;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StemDetailsScreenState();
  }
}

class _StemDetailsScreenState extends ConsumerState<StemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Verbs:',
              style: TextStyle(color: Colors.white),
            ),
            ...widget.verbs.map((v) => Text(
                  v.valueHebrew[HebrewLang.simple]!,
                  style: const TextStyle(color: Colors.red),
                )),
            const SizedBox(height: 12),
            const Text(
              'Nouns',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              'Adjectives',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
