import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BinyansScreen extends ConsumerStatefulWidget {
  const BinyansScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BinyansScreenState();
  }
}

class _BinyansScreenState extends ConsumerState<BinyansScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      "{binyans content}",
      style: TextStyle(color: Colors.white),
    )));
  }
}
