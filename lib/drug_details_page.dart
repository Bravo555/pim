import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'models/drug.dart';

class DrugDetailsPage extends StatefulWidget {
  const DrugDetailsPage(
      {super.key, required this.drug, required this.onChanged});

  final ValueChanged<Drug> onChanged;
  final Drug drug;
  final dynamic _value = "";

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
    //TODO save details
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drug Details"),
        actions: [
          IconButton(
            onPressed: _save,
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
              onSaved: (name) => setState(() {
                if (name != null) widget.drug.name = name;
              }),
            ),
            TextFormField(
                initialValue: widget.drug.dosage,
                validator: (value) => _validate(value),
                decoration: const InputDecoration(
                  hintText: "Dosage",
                  label: Text("Dosage"),
                ),
                onSaved: (dosage) => setState(() {
                      if (dosage != null) widget.drug.dosage = dosage;
                    })),
            DropdownButtonFormField(
              value: 1,
              hint: const Text("Frequency"),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Once a day"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Twice a day"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Three times a day"),
                ),
              ],
              onChanged: ((value) => {}),
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
                    onPressed: () {},
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        widget.onChanged(widget.drug);
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
