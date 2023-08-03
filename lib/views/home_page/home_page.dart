import 'package:firebase_firestore/models/item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../view_edit_screen/view_edit_screen.dart';

class HomePageScreenWidget extends StatefulWidget {
  const HomePageScreenWidget({super.key});

  @override
  State<HomePageScreenWidget> createState() => _HomePageScreenWidgetState();
}

class _HomePageScreenWidgetState extends State<HomePageScreenWidget> {
  List<Item> items = [];

  void getData() async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("item");

    reference.snapshots().listen((event) {
      items.clear();
      for (final doc in event.docs) {
        items.add(Item.fromJson(doc.data() as Map));
      }
      setState(() {});
    });
  }

  void factchDataFromFirebaseee() async {
    CollectionReference dBCollectionReference =
        FirebaseFirestore.instance.collection("item");

    await dBCollectionReference.get().then((event) => {
          for (final doc in event.docs)
            {items.add(Item.fromJson(doc.data() as Map))}
        });
    for (var element in items) {
      print("ID : ${element.id}");
      print("Title : ${element.title}");
      print("Content : ${element.content}");
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    // factchDataFromFirebaseee();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var flag = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ViewEditScreenWidget()));
        },
        child: const Text("+"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey<Item>(items[index]),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                child: const Icon(Icons.delete),
              ),
              onDismissed: (direction) async {
                await FirebaseStorage.instance
                    .refFromURL(items[index].imgUrl)
                    .delete();

                CollectionReference reference =
                    FirebaseFirestore.instance.collection("item");
                await reference.doc(items[index].id).delete();

                showToast(context, "delete successfully");
              },
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewEditScreenWidget(
                                editItem: items[index],
                              )));
                },
                title: Text(items[index].title),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(items[index].imgUrl),
                ),
              ),
            );
          },
          separatorBuilder: ((context, index) {
            return const Divider(
              thickness: 2,
            );
          }),
          itemCount: items.length),
    );
  }

  void showToast(BuildContext context, String text) {
    var scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: "Okay",
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ));
  }
}
