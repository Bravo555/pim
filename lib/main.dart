import 'package:flutter/material.dart';
import 'my_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drugsistant',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: const MaterialColor(
          0xFF222222,
          <int, Color>{
            50: Color(0xFFAAAAAA),
            100: Color(0xFF888888),
            200: Color(0xFF666666),
            300: Color(0xFF555555),
            400: Color(0xFF444444),
            500: Color(0xFF222222),
            600: Color(0xFF202020),
            700: Color(0xFF1A1A1A),
            800: Color(0xFF101010),
            900: Color(0xFF000000),
          },
        ),
      ),
      home: const MyPages(),
    );
  }
}
