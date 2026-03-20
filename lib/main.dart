import 'package:chatperlipopette/components/app_shell.dart';
import 'package:chatperlipopette/pages/catsInfos.dart';
import 'package:chatperlipopette/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => AppShell()),
    GoRoute(
      path: '/breed/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CatsInfos(id: id);
      },
    ),
    // W.I.P, Need to be implemented for the map, the same way as the breed
    /*
    GoRoute(
      path: '/breed/:id/map',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CatMap(id: id);
      },
    ),
     */
  ],
  initialLocation: '/'
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
