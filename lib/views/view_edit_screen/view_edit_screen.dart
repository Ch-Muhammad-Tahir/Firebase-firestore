import 'dart:io' as io;
import 'dart:io';

import 'package:firebase_firestore/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/item.dart';

class ViewEditScreenWidget extends StatefulWidget {
  final Item? editItem;
  const ViewEditScreenWidget({super.key, this.editItem});

  @override
  State<ViewEditScreenWidget> createState() => _ViewEditScreenWidgetState();
}

class _ViewEditScreenWidgetState extends State<ViewEditScreenWidget> {
  bool edit = false;
  final TextEditingController titleTextEditingController =
      TextEditingController();

  final TextEditingController contentTextEditingController =
      TextEditingController();
  var imagePath;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.editItem != null) {
      edit = true;
      titleTextEditingController.text = widget.editItem!.title;

      contentTextEditingController.text = widget.editItem!.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Detail Screen")),
      body: Column(
        children: [
          CustomTextField(
              hintText: "Enter title", controller: titleTextEditingController),
          CustomTextField(
              hintText: "Enter Something...",
              controller: contentTextEditingController),
          ElevatedButton(
              onPressed: () {
                onAddtab(context);
              },
              child: const Text("Add")),
          ElevatedButton(
              onPressed: () async {
                var locakimg = await uploadImageOnFireStore();
                imagePath = locakimg;
                print("Image Path $imagePath");
              },
              child: const Text("Upload Image"))
        ],
      ),
    );
  }

  Future<dynamic> uploadImageOnFireStore() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    } else {
      var file = File(image.path);
      final Reference storageRefrence =
          FirebaseStorage.instance.ref().child("images/${DateTime.now()}.png");
      final UploadTask uploadTask = storageRefrence.putFile(file);
      final TaskSnapshot snapshot = await uploadTask;
      final imgUrl = await snapshot.ref.getDownloadURL();
      showToast(context, "Image Uploaded");
      return imgUrl;
    }
  }

  void onAddtab(BuildContext context) async {
    String getTitle = titleTextEditingController.text.trim();
    String getContent = contentTextEditingController.text.trim();
    if (getTitle.isEmpty) {
      showToast(context, "Enter Title");
    } else if (getContent.isEmpty) {
      showToast(context, "Enter description");
    } else {
      if (edit) {
        var collection = FirebaseFirestore.instance.collection("item");
        collection.doc(widget.editItem!.id).update({
          "title": getTitle,
          "content": getContent,
          "id": widget.editItem!.id,
          "imgUrl": imagePath,
        }).whenComplete(() {
          showToast(context, "data successfully saved");
          Navigator.pop(context, true);
        });
      } else {
        print("Title: $getTitle");
        print("Content: $getContent");
        FirebaseFirestore dataBase = FirebaseFirestore.instance;
        final docRef = dataBase.collection("item").doc();
        await docRef.set({
          "title": getTitle,
          "content": getContent,
          "id": docRef.id,
          "imgUrl": imagePath,
        }).whenComplete(() {
          showToast(context, "data successfully Updated");
          Navigator.pop(context, true);
        });
      }
    }
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
