import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pim/drug_time_of_day_container.dart';
import 'package:provider/provider.dart';
import 'decorated_container.dart';
import 'time_utils.dart';
import 'models/drug_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  String toStringShort() => "Home";
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          DrugTimeOfDayContainer(drugTimeOfDay: DrugTimeOfDay.morning),
          DrugTimeOfDayContainer(drugTimeOfDay: DrugTimeOfDay.afternoon),
          DrugTimeOfDayContainer(drugTimeOfDay: DrugTimeOfDay.evening),
        ],
      ),
    );
  }
}
