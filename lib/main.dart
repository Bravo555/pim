import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pim/time_utils.dart';
import 'package:provider/provider.dart';

import 'models/drug_list.dart';
import 'models/times_of_day.dart';
import 'my_pages.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DrugList()),
    ChangeNotifierProvider(create: (context) => TimesOfDay())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    DrugList.readDrugList().then((drugList) =>
        Provider.of<DrugList>(context, listen: false).setItems(drugList));
    TimesOfDay.readTimesOfDay().then((timesOfDay) =>
        Provider.of<TimesOfDay>(context, listen: false)
            .setTimesOfDay(timesOfDay));
  }

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
