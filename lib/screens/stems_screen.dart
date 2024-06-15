import 'package:ani_lo_medaber_ivrit/db/stem_dao.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/widgets/stems_screen_card.dart';
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

  late Future<List<Stem>> _availableStems;

  @override
  void initState() {
    super.initState();
    _availableStems = StemDAO.getStems(50, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stems)")),
      body: FutureBuilder<List<Stem>>(
        future: _availableStems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>
                    StemsScreenCard(stem: snapshot.data![index]));
          }
        },
      ),
    );
  }
}
