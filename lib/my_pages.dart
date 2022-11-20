import 'package:flutter/material.dart';
import 'package:pim/drug_list.dart';
import 'package:pim/home_page.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  int _selectedIndex = 0;

// TODO Implement other pages
  final _widgetOptions = const <Widget>[
    HomePage(),
    DrugList(),
    Text(
      "Calendar",
      style: TextStyle(color: Colors.white),
    ),
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
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF222222),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "HOME",
            backgroundColor: Color(0xFF222222),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_outlined),
            activeIcon: Icon(Icons.medication),
            label: "DRUGS",
            backgroundColor: Color(0xFF222222),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: "CALENDAR",
            backgroundColor: Color(0xFF222222),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
        backgroundColor: const Color(0xFF222222),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Header"),
            ),
          ],
        ),
      ),
    );
  }
}
