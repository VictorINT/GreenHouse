import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenhouse/%20pages/HomePage.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GreenHouse',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(132, 217, 218, 1),
        secondaryHeaderColor: Color.fromRGBO(121, 213, 141, 1),
        cardColor: Color.fromRGBO(48,54,54,1),
        backgroundColor: const Color.fromRGBO(244,248,255,1),
        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              fontSize: 30.0,
              color: Color.fromRGBO(101,108,116,1),
              fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(fontSize: 22.0),
          bodyMedium: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(253, 255, 255, 0.4),
              fontWeight: FontWeight.bold
          ),
          bodyLarge: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(253, 255, 255, 1),
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      darkTheme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(132, 217, 218, 1),
        secondaryHeaderColor: Color.fromRGBO(121, 213, 141, 1),
        cardColor: Color.fromRGBO(48,54,54,1),
        backgroundColor: Color.fromRGBO(30, 32, 31, 1),
        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
            fontSize: 30.0,
            color: Color.fromRGBO(253, 255, 255,1),
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(fontSize: 22.0),
          bodyMedium: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(253, 255, 255, 0.4),
              fontWeight: FontWeight.bold
          ),
          bodyLarge: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(253, 255, 255, 1),
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}