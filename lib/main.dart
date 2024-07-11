import 'package:first_project/screens/feedback_screen.dart';
import 'package:first_project/screens/myhomescreen.dart';
import 'package:first_project/screens/profile_screen.dart';
import 'package:first_project/screens/settings_screen.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const MyHomeScreen(
              userName: '',
            ),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
        "/feedback": (context) => const FeedbackScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
