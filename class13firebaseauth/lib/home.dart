import 'dart:io';

import 'package:class13firebaseauth/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as pathh;

class Home extends StatefulWidget {
  final String uid;
  const Home({super.key, required this.uid});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool loading = false;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Posts').snapshots();
  grabData() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
                
                  title: const Text("Upload Your Data"),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextField(
                                                      decoration:const InputDecoration(label: Text('Title')),

                      controller: titleController,
                    ),
                    TextField(
                                                      decoration:const InputDecoration(label: Text('Description')),

                      controller: descriptionController,
                    ),
                    ElevatedButton(
                        onPressed: pickimage,
                        style: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.amber),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                side: const BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        child: const Text("Pick_Image")),
                    loading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : ElevatedButton(
                        onPressed: upload,
                        style: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.amber),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                side: const BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        child: const Text("Upload")),
                  ]),
                );
        });
  }

  // String? imagePath;
  String imageName = "";
  String imagePath = "";
  pickimage() async {
    ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery) as XFile;

    String name = pathh.basename(image.path);

    setState(() {
      // imagePath=image.path;
      imageName = name;
      imagePath = image.path;
    });
  }

  upload() async {
    setState(() {
      loading = true;
    });
    if (imagePath == "" || imageName == "") {
      final snackbar = SnackBar(
        content: const Text("You hav'nt Picked up and image"),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      );
      disposePopUp();

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      final storage = FirebaseStorage.instance.ref(imageName);
      File file = File(imagePath);
      await storage.putFile(file);
      String url = await storage.getDownloadURL();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('Posts').add({
        "title": titleController.text,
        "description": descriptionController.text,
        "url": url,
        'uid': widget.uid,
      });
      setState(() {
        loading = false;
      });
      disposePopUp();
    }
  }

  disposePopUp() {
    setState(() {
      titleController.text = "";
      descriptionController.text = "";
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Center(child: Text("Your Private Data"),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                final String id = document.id;
                data["id"] = id;
                data["uid1"] = widget.uid;
                if (data['uid'] != widget.uid) {
                  return Container();
                } else {
                  return Post(data: data);
                }
              }).toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
          onPressed: grabData, child: const Icon(Icons.add)),
    );
  }
}
