import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/drug.dart';
import 'models/drug_list.dart';

class DrugDetailsPage extends StatefulWidget {
  DrugDetailsPage({super.key, Drug? drug}) {
    if (drug != null) {
      this.drug = drug;
      newDrug = false;
    }
  }

  bool newDrug = true;
  Drug drug = Drug();

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

  _save() {
    final form = _formKey.currentState!;
    form.save();
    final drug = widget.drug;
    if (widget.newDrug) {
      Provider.of<DrugList>(context, listen: false).add(drug);
    } else {
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
            onPressed: () {
              final form = _formKey.currentState;
              if (form == null) return;
              if (form.validate()) {
                _save();
                Navigator.of(context).pop();
              }
            },
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
              onSaved: (name) => widget.drug.name = name!,
            ),
            TextFormField(
                initialValue: widget.drug.dosage,
                validator: (value) => _validate(value),
                decoration: const InputDecoration(
                  hintText: "Dosage",
                  label: Text("Dosage"),
                ),
                onSaved: (dosage) => widget.drug.dosage = dosage!),
            DropdownButtonFormField(
              value: widget.drug.frequency,
              hint: const Text("Frequency"),
              items: const [
                DropdownMenuItem(
                  value: DosageFrequency.onceADay,
                  child: Text("Once a day"),
                ),
                DropdownMenuItem(
                  value: DosageFrequency.twiceADay,
                  child: Text("Twice a day"),
                ),
                DropdownMenuItem(
                  value: DosageFrequency.thriceADay,
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
                      final form = _formKey.currentState;
                      if (form == null) return;
                      if (form.validate()) {
                        _save();
                        Navigator.of(context).pop();
                      }
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
