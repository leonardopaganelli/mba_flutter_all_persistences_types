import 'package:flutter/material.dart';
import 'package:mba_flutter_all_persistences_types/floor/add.dart';
import 'package:mba_flutter_all_persistences_types/floor/models/book.dart';

class ListFloorWidget extends StatefulWidget {
  const ListFloorWidget({Key? key}) : super(key: key);
  final title = const Text("Floor");

  @override
  ListFloorWidgetState createState() => ListFloorWidgetState();
}

class ListFloorWidgetState extends State<ListFloorWidget> {
  List<Book> Books = [];

  @override
  void initState() {
    super.initState();
  }

  getAll() async {
  }

  insert(Book Book) async {
  }

  delete(int index) async {
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
                      MaterialPageRoute(builder: (context) => AddBook()))
                      .then((Book){
                        setState(() {
                          insert(Book);
                        });
                      });
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => buildListItem(index),
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemCount: Books.length
        ),
    );
  }

  Widget buildListItem(int index) {
    Book p = Books[index];


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
            leading: Text(p.id != null ? p.id.toString() : "-1"),
            title: Text(p.name),
            subtitle: Text(p.author),
            onLongPress: (){

            },),
      ),
    );
  }
}
