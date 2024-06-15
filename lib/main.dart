import 'package:ani_lo_medaber_ivrit/db/db.dart';
import 'package:ani_lo_medaber_ivrit/screens/main_tabs_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Sqflite.setDebugModeOn(true);
  initDb().then((value) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: FlexThemeData.light(scheme: FlexScheme.flutterDash),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.flutterDash),
      themeMode: ThemeMode.system,
      home: const MainTabsScreen(),
    );
  }
}
