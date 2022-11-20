import 'package:flutter/material.dart';
import 'decorated_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final title = "Home";

  final homeTextStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DecoratedContainer(
            isColoured: true,
            child: Text(
              "",
              style: homeTextStyle,
            ),
          ),
          DecoratedContainer(),
          DecoratedContainer(),
        ],
      ),
    );
  }

  @override
  String toStringShort() {
    return "Home";
  }
}
