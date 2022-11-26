import 'package:flutter/material.dart';
import 'package:pim/calendar_page.dart';
import 'package:pim/drug_list_page.dart';
import 'package:pim/home_page.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  int _selectedIndex = 0;

  final _widgetOptions = const <Widget>[
    HomePage(),
    DrugList(),
    CalendarPage(),
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
          )
        ],
      ),
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
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: "CALENDAR",
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
