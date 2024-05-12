import 'package:ani_lo_medaber_ivrit/screens/binyans_screen.dart';
import 'package:ani_lo_medaber_ivrit/screens/stems_screen.dart';
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
  int screenIdx = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    if (screenIdx == 0) {
      currentScreen = const StemsScreen();
    } else if (screenIdx == 1) {
      currentScreen = const BinyansScreen();
    } else {
      throw Exception("unexpected index $screenIdx");
    }

    return Scaffold(
      // appBar: AppBar(title: const Text("{placeholder appbar title}")),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIdx,
        onTap: (idx) => setState(() => screenIdx = idx),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "Stems",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined),
            label: "Binyans",
          ),
        ],
      ),
    );
  }
}
