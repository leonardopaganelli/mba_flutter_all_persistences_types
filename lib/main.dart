import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/screens/home.dart';
import 'package:mba_flutter_all_persistences_types/sqlite/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeWidget(),
        "/sqlite": (context) => ListSQLiteWidget(),
      },
    );
  }
}
