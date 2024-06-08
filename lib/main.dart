import 'package:boumedstore/views/home.view.dart';
import 'package:flutter/material.dart';

main() => runApp(const StoreApp());

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      routes: {
        HomeView.id: (context) => const HomeView(),
        // UpdateProductView.id: (context) => UpdateProductView(),
      },
      initialRoute: HomeView.id,
      home: const HomeView(),
    );
  }
}
