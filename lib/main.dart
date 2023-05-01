import 'package:flutter/material.dart';

import 'package:food_app_flutter/themes/color_schemes.dart';
import 'package:food_app_flutter/pages/layout.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
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
