import 'package:chatperlipopette/components/app_shell.dart';
import 'package:chatperlipopette/pages/search.dart';
import 'package:chatperlipopette/themes/light_theme.dart';
import 'package:chatperlipopette/pages/catsInfos.dart';
import 'package:chatperlipopette/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        // Home page with bottom navigation bar (need to be implemented)
        '/': (context) => AppShell(),
        '/search': (context) => Search(),
      },
    );
  }
}
