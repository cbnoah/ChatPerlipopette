import 'package:chatperlipopette/components/search_page_container.dart';
import 'package:chatperlipopette/pages/search.dart';
import 'package:chatperlipopette/themes/light_theme.dart';
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
      home: Search(),
      theme: lightTheme,
    );
  }
}
