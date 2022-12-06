import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'models/drug.dart';

class DecoratedContainer extends StatelessWidget {
  DecoratedContainer(
      {super.key,
      required this.drugs,
      required this.timeOfDay,
      this.isColoured = false});

  final TimeOfDay timeOfDay;
  final Iterable<Drug> drugs;

  final bool isColoured;

  late final homeBoxDecoration = BoxDecoration(
    backgroundBlendMode: BlendMode.srcOver,
    color: Colors.black,
    boxShadow: [
      BoxShadow(
        color: isColoured ? Colors.blue : Colors.blueGrey,
        blurRadius: 4,
        spreadRadius: 4,
      ),
    ],
    border: const Border(),
  );

  Widget _getDrugsAsWidgets(Iterable<Drug> drugs) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: drugs
          .where((drug) => drug.shouldNotify)
          .map((drug) => Text("${drug.name} ${drug.dosage}"))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: homeBoxDecoration,
      padding: const EdgeInsets.all(8.0),
      width: 300,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getDrugsAsWidgets(drugs),
          TimerBuilder.periodic(Duration(seconds: 1),
              builder: (context) => Text(
                    _getTimeUntil(timeOfDay),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  )),
        ],
      ),
    );
  }

  String _getTimeUntil(TimeOfDay other) {
    DateTime now = DateTime.now();
    int day = (now.hour < other.hour) ||
            (now.hour == other.hour && now.minute <= other.minute)
        ? now.day
        : now.day + 1;
    DateTime until =
        DateTime(now.year, now.month, day, other.hour, other.minute);
    return until.difference(now).toString().split(".")[0];
  }
}
