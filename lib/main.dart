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
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        // Home page with bottom navigation bar (need to be implemented)
        '/': (context) => Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/search');
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
          body: Center(
            child: Text(
              "Bienvenue sur ChatPerlipopette !",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        '/search': (context) => Search(),
      },
    );
  }
}
