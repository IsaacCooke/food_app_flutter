import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:food_app_flutter/data/services/challenge_service.dart';
import 'package:food_app_flutter/pages/layout.dart';
import 'package:food_app_flutter/data/services/day_services.dart';
import 'package:food_app_flutter/themes/color_schemes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;
  DayService().initDatabase();
  ChallengeService().initDatabase();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // Root application widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const Layout(),
      theme: ThemeData(
        colorScheme: lightColorScheme,
        primaryColor: lightColorScheme.primary,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        primaryColor: darkColorScheme.primary,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
