import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/firebase/list.dart';
import 'package:mba_flutter_all_persistences_types/floor/list.dart';
import 'package:mba_flutter_all_persistences_types/screens/home.dart';
import 'package:mba_flutter_all_persistences_types/sqlite/list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        "/sqlite": (context) => const ListSQLiteWidget(),
        "/floor": (context) => const ListFloorWidget(),
        "/firebase": (context) => const ListCarFirestoreWidget(),
      },
    );
  }
}
