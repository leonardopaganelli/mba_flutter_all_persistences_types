import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/firebase/models/Car.dart';


class AddCar extends StatelessWidget {
  AddCar({Key? key}) : super(key: key);
  final Text title = const Text("Novo Carro");
  final EdgeInsets padding = const EdgeInsets.all(16);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();

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
                          hintText: "Nome do Carro",
                          labelText: "Nome do Carro"),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o nome do Carro";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Marca do carro",
                          labelText: "Marca do carro"),
                      controller: _brandNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira a marca do carro";
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Car car = Car(
                              name: _nameController.text,
                              brand: _brandNameController.text,
                            );
                            Navigator.pop(context, Car);
                          }
                        },
                        child: const Text("Gravar"),
                      ),
                    )
                  ]),
            )));
  }
}
