import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

// TODO check what adapter we should use in data repository or scrap that
// @DataRepository([ConfigureRepositoryLocalStorage], remote: false)
@JsonSerializable()
class Drug /*extends DataModel<Drug>*/ {
  // @override
  final int id;
  String name;
  String dosage;
  String frequency;
  String notes;
  bool shouldNotify;

  Drug({
    required this.id,
    required this.name,
    required this.dosage,
    this.frequency = "Once a day",
    this.notes = "",
    this.shouldNotify = false,
  });
}
