import 'package:flutter/material.dart';
import 'package:pim/drug_list_item.dart';
import 'package:pim/models/drug.dart';
import 'package:provider/provider.dart';
import 'models/drug_list.dart';

class DrugListPage extends StatefulWidget {
  const DrugListPage({super.key});

  @override
  State<StatefulWidget> createState() => _DrugListPageState();
}

class _DrugListPageState extends State<DrugListPage> {
  @override
  Widget build(BuildContext context) => Consumer<DrugList>(
      builder: (context, drugList, child) => ListView.builder(
          itemCount: drugList.items.length,
          itemBuilder: (context, index) =>
              _getDrugListItem(index, drugList.items[index])));

  Widget _getDrugListItem(int id, Drug drug) => DrugListItem(drug: drug);

  @override
  String toStringShort() => "Drug List";
}
