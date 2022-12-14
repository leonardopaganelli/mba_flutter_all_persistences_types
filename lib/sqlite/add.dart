import 'package:flutter/material.dart';

import 'models/person.dart';

class AddPerson extends StatelessWidget {
  AddPerson({Key? key}) : super(key: key);
  final Text title = const Text("Nova Pessoa");
  final EdgeInsets padding = const EdgeInsets.all(16);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: title),
        body: Padding(
            padding: padding,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Nome da Pessoa",
                          labelText: "Nome da Pesoa"),
                      controller: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o nome da pessoa";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Sobrenome da Pessoa",
                          labelText: "Sobrenome da Pessoa"),
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o sobrenome da pessoa";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Endere??o da Pessoa",
                          labelText: "Endere??o da Pessoa"),
                      controller: _addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o endere??o da pessoa";
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Person person = Person(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              address: _addressController.text
                            );
                            Navigator.pop(context, person);
                          }
                        },
                        child: const Text("Gravar"),
                      ),
                    )
                  ]),
            )));
  }
}
