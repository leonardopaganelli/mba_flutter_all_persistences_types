import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/floor/models/book.dart';


class AddBook extends StatelessWidget {
  AddBook({Key? key}) : super(key: key);
  final Text title = const Text("Nova Pessoa");
  final EdgeInsets padding = const EdgeInsets.all(16);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

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
                          hintText: "Nome do Livro",
                          labelText: "Nome do Livro"),
                      controller: _bookNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o nome do Livro";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Sobrenome do Autor",
                          labelText: "Sobrenome do Autor"),
                      controller: _authorController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o sobrenome do Autor";
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Book book = Book(
                              author: _bookNameController.text,
                              name: _authorController.text,
                            );
                            Navigator.pop(context, book);
                          }
                        },
                        child: const Text("Gravar"),
                      ),
                    )
                  ]),
            )));
  }
}
