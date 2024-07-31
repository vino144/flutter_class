import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:first_project/screens/feedback_screen.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:first_project/screens/myhomescreen.dart';
import 'package:first_project/screens/phone_login.dart';
import 'package:first_project/screens/profile_screen.dart';
import 'package:first_project/screens/settings_screen.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:first_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase SDK
  await Firebase.initializeApp();
  //FirebaseCrashlytics.instance.crash();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initServiceLocator();
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
        '/phone-login': (context) => const PhoneAuthScreen(),
        '/login': (context) => const LoginScreen(),
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
