import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Buddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B0000), // Morehouse Maroon
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {'/home': (context) => const HomeScreen()},
    );
  }
}
