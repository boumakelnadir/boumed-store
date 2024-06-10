import 'package:boumedstore/views/home.view.dart';
import 'package:boumedstore/views/onboarding_screen.dart';
import 'package:flutter/material.dart';

main() => runApp(const StoreApp());

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      routes: {
        HomeView.id: (context) => const HomeView(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
      },
      initialRoute: OnboardingScreen.id,
      home: const HomeView(),
    );
  }
}
