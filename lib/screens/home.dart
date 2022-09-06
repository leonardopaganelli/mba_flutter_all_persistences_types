import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/utils/customWidgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  final title = const Text("Flutter Persistências");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: title),
        body: Column(
          children: [
            ListTile(
              leading: buildSvgIcon("images/sqlite-icon.svg"),
              title: const Text("SQLite"),
              subtitle: const Text("Lista de pessoas"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushNamed(context, "/sqlite");
              },
            ),
            divisorListMain(),
            ListTile(
              leading: buildSvgIcon("images/db.svg"),
              title: const Text("Floor"),
              subtitle: const Text("Lista de livros"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushNamed(context, "/floor");
              },
            ),
            divisorListMain(),
            ListTile(
              leading: buildSvgIcon("images/firebase.svg"),
              title: const Text("Firebase"),
              subtitle: const Text("Lista de carros"),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushNamed(context, "/firebase");
              },
            ),
            divisorListMain()
          ],
        ));
  }
}
