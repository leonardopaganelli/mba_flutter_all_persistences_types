import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/sqlite/add.dart';
import 'package:mba_flutter_all_persistences_types/sqlite/models/person.dart';

class ListSQLiteWidget extends StatelessWidget {
  ListSQLiteWidget({Key? key}) : super(key: key);
  final title = const Text("SQLite");

  final List<Person> persons = [
    Person(firstName: "123", lastName: "123", address: "123")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPerson()));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView(
          children: buildListItems(),
        ));
  }

  List<Padding> buildListItems() {
    return persons
        .map((p) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                    leading: Text(p.id != null ? p.id.toString() : "-1"),
                    title: Text(p.firstName),
                    subtitle: Text(p.lastName)),
              ),
            ))
        .toList();
  }
}
