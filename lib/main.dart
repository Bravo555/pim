import 'package:flutter/material.dart';
import 'my_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drugsistant',
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(
          shape: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        popupMenuTheme: const PopupMenuThemeData(
          color: Color(0xFF222222),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF222222),
        ),
        unselectedWidgetColor: Colors.grey,
        primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(fontWeight: FontWeight.bold),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.blue,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.black,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Color(0xFF222222),
          onSurface: Colors.white,
          tertiary: Colors.grey,
        ),
      ),
      home: const MyPages(),
    );
  }
}
