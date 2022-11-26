import 'dart:developer';

import 'package:flutter/material.dart';

class DrugDetailsPage extends StatefulWidget {
  const DrugDetailsPage({super.key, required this.id});

  final int id;

  @override
  State<DrugDetailsPage> createState() => _DrugDetailsPageState();
}

class _DrugDetailsPageState extends State<DrugDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic _value;

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
              keyboardType: TextInputType.text,
              validator: (value) => _validate(value),
              decoration: const InputDecoration(
                hintText: "Drug name",
                label: Text("Drug name"),
              ),
            ),
            TextFormField(
              validator: (value) => _validate(value),
              decoration: const InputDecoration(
                hintText: "Dosage",
                label: Text("Dosage"),
              ),
            ),
            DropdownButtonFormField(
              value: _value,
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
              onChanged: ((value) => {_value = value}),
            ),
            TextFormField(
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
                    onPressed: () {},
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
