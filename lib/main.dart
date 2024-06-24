import 'dart:developer';
import 'package:boumedstore/views/home.view.dart';
import 'package:boumedstore/views/sign_in_view.dart';
import 'package:boumedstore/views/sign_up_view.dart';
import 'package:boumedstore/views/onboarding_screen.dart';
import 'package:boumedstore/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StoreApp());
}

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
  }

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
        SplashView.id: (context) => const SplashView(),
        SignUpView.id: (context) => const SignUpView(),
        SignInView.id: (context) => const SignInView(),
      },
      // initialRoute: SplashView.id,
      home: SignUpView(),
      // const HomeView(),
    );
  }
}
