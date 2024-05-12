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
    return const Scaffold(
        body: Center(
            child: Text(
      "{stems content}",
      style: TextStyle(color: Colors.white),
    )));
  }
}
