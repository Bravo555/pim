import 'package:flutter/material.dart';
import 'package:pim/models/drug.dart';
import 'decorated_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final title = "Home";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DecoratedContainer(
            isColoured: true,
            drugs: <Drug>[
              Drug(
                id: 1,
                name: "Espumisan",
                dosage: "20mg",
                shouldNotify: true,
              ),
              Drug(
                id: 2,
                name: "Aspiryna",
                dosage: "10mg",
                shouldNotify: true,
              )
            ],
          ),
          DecoratedContainer(
            drugs: <Drug>[
              Drug(
                id: 3,
                name: "Bianacid",
                dosage: "40mg",
                shouldNotify: true,
              ),
            ],
          ),
          DecoratedContainer(
            drugs: <Drug>[
              Drug(
                id: 4,
                name: "No-Spa",
                dosage: "10mg",
                shouldNotify: false,
              ),
              Drug(
                id: 1,
                name: "Espumisan",
                dosage: "20mg",
                shouldNotify: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  String toStringShort() {
    return "Home";
  }
}
