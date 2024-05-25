import 'package:ani_lo_medaber_ivrit/providers/tab_screen_provider.dart';
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
  void _setScreenOnIndex(int idx) {
    switch (idx) {
      case 0:
        ref.read(currentScreenProvider.notifier).state = const StemsScreen();
        break;
      case 1:
        ref.read(currentScreenProvider.notifier).state = const BinyansScreen();
        break;
      default:
        throw Exception("Unexpected index $idx");
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentScreen = ref.watch(currentScreenProvider);

    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) => _setScreenOnIndex(idx),
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
