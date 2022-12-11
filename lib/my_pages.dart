import 'package:flutter/material.dart';
import 'package:pim/preferences_page.dart';
import 'package:pim/drug_list_page.dart';
import 'package:pim/home_page.dart';

import 'drug_details_page.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  int _selectedIndex = 0;

  final _widgetOptions = const <Widget>[
    HomePage(),
    DrugListPage(),
    PreferencesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetOptions.elementAt(_selectedIndex).toStringShort()),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () => {/* TODO implement logic */},
                  icon: const Icon(Icons.notifications)),
              IconButton(
                  onPressed: () => {showAboutDialog(context: context)},
                  icon: const Icon(Icons.info)),
            ],
          ),
        ],
      ),
      // TODO: this looks really bad, but I don't really know how to fix it.
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrugDetailsPage(),
                  ),
                );
              },
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_outlined),
            activeIcon: Icon(Icons.medication),
            label: "DRUGS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: "PREFERENCES",
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
