import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moral_mentor/pages/home.dart';
import 'package:moral_mentor/pages/scenarios_page.dart';
import 'package:moral_mentor/pages/profile.dart';
import 'package:moral_mentor/widgets/quiz_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/scenarios_page',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ScenariosPage(),
          transitionsBuilder: _slideTransition,
        ),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ProfilePage(),
          transitionsBuilder: _slideTransition,
        ),
      ),
    ],
  );

  static Widget _fadeTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }

  static Widget _slideTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MoralMentor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
      routerConfig: _router,
    );
  }
}
