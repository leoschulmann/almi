import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("{placeholder appbar title}")),
      body: const Center(
          child: Text(
        "{placeholder app content}",
        style: TextStyle(color: Colors.white),
      )),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: "Stems",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_tree_outlined),
          label: "Binyans",
        ),
      ]),
    );
  }
}
