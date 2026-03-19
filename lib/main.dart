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
      debugShowCheckedModeBanner: false,
      title: 'ChatPerliPopette',
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        useMaterial3: true,
      ),
      home: const CatsInfos(),
    );
  }
}
