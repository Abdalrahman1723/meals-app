import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/taps_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            // seedColor: Color.fromARGB(255, 13, 255, 0),
            seedColor: const Color.fromARGB(255, 255, 128, 0),
            brightness: Brightness.dark),
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(),
        appBarTheme: const AppBarTheme().copyWith(
  
        ),
      ),
      home: const TapsScreen(),
    );
  }
}
