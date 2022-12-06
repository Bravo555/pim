import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/drug.dart';
import 'models/drug_list.dart';

class DrugDetailsPage extends StatefulWidget {
  const DrugDetailsPage({super.key, required this.drug});

  final Drug drug;

  @override
  State<DrugDetailsPage> createState() => _DrugDetailsPageState();
}

class _DrugDetailsPageState extends State<DrugDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill this field';
    }
    return null;
  }

  _save(Drug drug) {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      Provider.of<DrugList>(context, listen: false).editDrug(drug);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drug Details"),
        actions: [
          IconButton(
            onPressed: () => _save(widget.drug),
            icon: const Icon(Icons.save_alt),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            TextFormField(
              initialValue: widget.drug.name,
              keyboardType: TextInputType.text,
              validator: (value) => _validate(value),
              decoration: const InputDecoration(
                hintText: "Drug name",
                label: Text("Drug name"),
              ),
              onSaved: (name) => {if (name != null) widget.drug.name = name},
            ),
            TextFormField(
                initialValue: widget.drug.dosage,
                validator: (value) => _validate(value),
                decoration: const InputDecoration(
                  hintText: "Dosage",
                  label: Text("Dosage"),
                ),
                onSaved: (dosage) =>
                    {if (dosage != null) widget.drug.dosage = dosage}),
            DropdownButtonFormField(
              value: widget.drug.frequency,
              hint: const Text("Frequency"),
              items: const [
                DropdownMenuItem(
                  value: "Once a day",
                  child: Text("Once a day"),
                ),
                DropdownMenuItem(
                  value: "Twice a day",
                  child: Text("Twice a day"),
                ),
                DropdownMenuItem(
                  value: "Three times a day",
                  child: Text("Three times a day"),
                ),
              ],
              onChanged: ((value) =>
                  {if (value != null) widget.drug.frequency = value}),
            ),
            TextFormField(
              initialValue: widget.drug.notes,
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 3,
              decoration: const InputDecoration(
                icon: Icon(Icons.notes),
                hintText: "Notes",
                label: Text("Notes"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.error),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _save(widget.drug);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
