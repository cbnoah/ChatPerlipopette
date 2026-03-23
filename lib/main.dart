import 'package:chatperlipopette/components/app_shell.dart';
import 'package:chatperlipopette/pages/catsInfos.dart';
import 'package:chatperlipopette/themes/dark_theme.dart';
import 'package:chatperlipopette/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    // Define the main route for the app shell
    GoRoute(path: '/', builder: (context, state) => AppShell()),
    // Define a route for the cat information page, using a path parameter for the cat ID
    GoRoute(
      path: '/breed/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CatsInfos(id: id);
      },
    ),
  ],
  initialLocation: '/',
  redirect: (context, state) {
    // Redirect logic can be added here if needed, for example to handle authentication or deep linking
    if (state.uri.scheme == 'chatperlipopette' || state.uri.scheme == 'https') {
      return null;
    }
    return null;
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // Use the system theme mode to automatically switch between light and dark themes
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
