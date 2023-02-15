import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as pathh;

class Post extends StatefulWidget {
  final Map<String, dynamic> data;

  const Post({super.key, required this.data});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  edit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PopupMenuItem(child: Text("data"));
          // return const AlertDialog(content: Text("data"),);
        });
  }

  @override
  void initState() {
    super.initState();
    titleController.text = widget.data['title'];
    descriptionController.text = widget.data['description'];
  }

  //pop up for getting data
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool loading = false;
  grabData() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update Your Data"),
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
                  ? const CircularProgressIndicator()
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
                        child: const Text("Update")),
            ]),
          );
        });
  }

//picking up the image
  String? imageName;
  String? imagePath;
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

//uploading data
  upload() async {
    setState(() {
      loading = true;
    });
    if (imagePath == null || imageName == null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('Posts').doc(widget.data['id']).set({
        "title": titleController.text,
        "description": descriptionController.text,
        "url": widget.data['url'],
        'uid': widget.data['uid1'],
      });
      disposePopUp();
    } else {
      final storage = FirebaseStorage.instance.ref(imageName);
      File file = File(imagePath as String);
      await storage.putFile(file);
      String url = await storage.getDownloadURL();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('Posts').doc(widget.data['id']).set({
        "title": titleController.text,
        "description": descriptionController.text,
        "url": url,
        'uid': widget.data['uid1'],
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

  delete() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('Posts').doc(widget.data['id']).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(
        left: 8,
      ),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>View(path:widget.data['url']))); 
            } ,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage("${widget.data['url']}"),
                      fit: BoxFit.fill),
                  border: Border.all(width: 3)),
            
              // child: Image.network(
              //   "${widget.data['url']}",
              //   height: MediaQuery.of(context).size.height * .25,
              //   width: MediaQuery.of(context).size.width * .4,
              //   fit: BoxFit.fill,
              // ),
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width * .30,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            height: MediaQuery.of(context).size.height * .12,
            width: MediaQuery.of(context).size.width * .50,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("\t\t\t${widget.data["title"]}"),
                  const Text(
                    "Description:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("\t\t\t${widget.data["description"]}"),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: PopupMenuButton(
              child: const Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Icon(Icons.edit),
                        Text("Edit"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Icon(Icons.delete),
                        Text("Delete"),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) => {
                if (value == 1) {grabData()} else if (value == 2) {delete()}
              },
            ),
          )
        ],
      ),
    );
  }
}

class View extends StatefulWidget {
  final String path;
  const View({super.key, required this.path});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  bool loading=false;
  savepick()async{
    setState(() {
      loading=true;
    });
    await GallerySaver.saveImage(widget.path,albumName: 'Flutter');
      
    setState(() {
      loading=false;
    });
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Download Picture"),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width *1,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.path),fit: BoxFit.fill)),
            ),
          ),
          loading?Row(mainAxisAlignment: MainAxisAlignment.center,children:const [Text("Saving...\t\t\t"),CircularProgressIndicator(color: Colors.black,strokeWidth: 3,)],): ElevatedButton.icon(
                        onPressed: savepick,
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
                        icon: const Icon(Icons.download),
                        label: const Text("Download")),
        ],
      ),
    );
  }
}
