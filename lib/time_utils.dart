import 'package:flutter/material.dart';

import 'models/drug.dart';

enum DrugTimeOfDay {
  morning,
  afternoon,
  evening;

  String toJson() => toString();
}
