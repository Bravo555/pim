import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'decorated_container.dart';
import 'models/drug_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final title = "Home";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<DrugList>(
              builder: (context, drugList, child) => DecoratedContainer(
                    isColoured: true,
                    timeOfDay: const TimeOfDay(hour: 8, minute: 0),
                    drugs: drugList.drugsForTimeOfDay(DrugTimeOfDay.morning),
                  )),
          Consumer<DrugList>(
              builder: (context, drugList, child) => DecoratedContainer(
                  timeOfDay: const TimeOfDay(hour: 14, minute: 0),
                  drugs: drugList.drugsForTimeOfDay(DrugTimeOfDay.afternoon))),
          Consumer<DrugList>(
              builder: (context, drugList, child) => DecoratedContainer(
                    timeOfDay: const TimeOfDay(hour: 20, minute: 0),
                    drugs: drugList.drugsForTimeOfDay(DrugTimeOfDay.evening),
                  )),
        ],
      ),
    );
  }

  @override
  String toStringShort() {
    return "Home";
  }
}
