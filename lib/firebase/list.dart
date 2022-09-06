import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/firebase/add.dart';
import 'package:mba_flutter_all_persistences_types/firebase/models/Car.dart';

class ListCarFirestoreWidget extends StatefulWidget {
  const ListCarFirestoreWidget({Key? key}) : super(key: key);
  final title = const Text("Carros");

  @override
  ListCarFirestoreWidgetState createState() => ListCarFirestoreWidgetState();
}

class ListCarFirestoreWidgetState extends State<ListCarFirestoreWidget> {
  List<Car> cars = [];

  insert(Car car) async {
    FirebaseFirestore.instance.collection("cars").add(car.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.title,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCar()))
                      .then((car){
                        setState(() {
                          insert(car);
                        });
                      });
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: buildList(context)
    );
  }

  Widget buildList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("cars").snapshots(),
      builder: (context, snapshot){
        if (!snapshot.hasData) return const LinearProgressIndicator();
        if (snapshot.data == null) {
          return Container(child: const Text("Nenhum carro encontrado"));
        } else {
          return buildListSeparated(context, snapshot.data!.docs);
        }
      } 
    );
  }

  Widget buildListSeparated(BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context, QueryDocumentSnapshot data) {
    Car c = Car.fromSnapshot(data);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
            leading: Text( "-1"),
            title: Text(c.name),
            subtitle: Text(c.brand),
            onLongPress: (){
              data.reference.delete();
            },),
      ),
    );
  }
}
