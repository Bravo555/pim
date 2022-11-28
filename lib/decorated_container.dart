import 'package:flutter/material.dart';
import 'models/drug.dart';

class DecoratedContainer extends StatelessWidget {
  DecoratedContainer({super.key, required this.drugs, this.isColoured = false});

  final List<Drug> drugs;

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

  Widget getDrugsAsWidgets(List<Drug> drugs) {
    List<Widget> widgets = List<Widget>.empty(growable: true);
    for (var i = 0; i < drugs.length; i++) {
      if (drugs.elementAt(i).shouldNotify) {
        widgets.add(
            Text("${drugs.elementAt(i).name} ${drugs.elementAt(i).dosage}"));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: homeBoxDecoration,
      width: 300,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getDrugsAsWidgets(drugs),
          const Text("Date when to take the dose"),
        ],
      ),
    );
  }
}
