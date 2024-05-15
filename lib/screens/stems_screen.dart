import 'package:ani_lo_medaber_ivrit/db/common_dao.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => CommonDAO.getAllStems(),
          child: const Text("click"),
        ),
      ),
    );
  }
}
