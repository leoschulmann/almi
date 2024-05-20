import 'package:ani_lo_medaber_ivrit/db/common_dao.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/widgets/stem_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StemsScreen extends ConsumerStatefulWidget {
  const StemsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StemsScreenState();
  }
}

class _StemsScreenState extends ConsumerState<StemsScreen> {
  List<Stem> currentStems = [];

  Future<void> fetchData() async {
    List<Stem> stems = await CommonDAO.getStems(50, 0);
    setState(() => currentStems = stems);
  }

  Widget getBody() {
    if (currentStems.isEmpty) {
      return const Center(
        child: Text('no data'),
      );
    } else {
      return ListView.builder(
        itemCount: currentStems.length,
        itemBuilder: (context, index) {
          return Text(
            currentStems[index].valueHebrew[HebrewLang.simple]!,
            style: const TextStyle(color: Colors.white),
          );
        },
      );
    }
  }

  Widget drawBody() {
    if (currentStems.isEmpty) {
      return Center(
        child: ElevatedButton(onPressed: fetchData, child: const Text("Load stems from DB")),
      );
    } else {
      return ListView.builder(
        itemCount: currentStems.length,
        itemBuilder: (context, index) {
          return StemContainer(stem: currentStems[index]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: drawBody(),
    );
  }
}
