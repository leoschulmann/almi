import 'package:ani_lo_medaber_ivrit/db/samples_dao.dart';
import 'package:ani_lo_medaber_ivrit/styles/style_helper.dart';
import 'package:flutter/material.dart';

class LikableTextSample extends StatefulWidget {
  LikableTextSample(
      {super.key, required this.value, required this.translation, required this.liked, required this.sampleId});

  final int sampleId;
  bool liked;
  final String value;
  final String translation;

  @override
  State<LikableTextSample> createState() => _LikableTextSampleState();
}

class _LikableTextSampleState extends State<LikableTextSample> {
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                SamplesDAO.setLiked(widget.sampleId, !widget.liked)
                    .then((_) => setState(() => widget.liked = !widget.liked));
              },
              child: widget.liked ? const Icon(Icons.star) : const Icon(Icons.star_outline)),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.value, style: StyleHelper.getItalicLatin(theme.titleMedium!)),
                Text('(${widget.translation})', style: StyleHelper.getItalicLatin(theme.titleMedium!)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
