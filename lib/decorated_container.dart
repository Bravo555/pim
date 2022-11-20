import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  DecoratedContainer({super.key, this.child, this.isColoured = false});

  final Widget? child;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: homeBoxDecoration,
      width: 300,
      height: 150,
      child: child,
    );
  }
}
