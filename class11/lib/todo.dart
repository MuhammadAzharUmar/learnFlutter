import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  dynamic item;
  List<dynamic> lst = ["Muhammad", "Azhar", "GCUF"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: ListView.builder(
          itemCount: lst.length,
          itemBuilder: ((context, index) {
            return Container(
              color: Colors.amber,
              margin: const EdgeInsets.only(top: 5),
              child: ListTile(
                leading:const  CircleAvatar(backgroundColor: Colors.black87,
                  child: Icon(Icons.favorite,color: Colors.red,)),
                title: Text("${lst[index]}"),
                trailing: PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: ((context) {
                   return [
                        const  PopupMenuItem( value: 'edit',
                        child: Text("Edit")),
                        const  PopupMenuItem( value: 'delete',
                        child: Text("Delete")),
                    ];
                  }),
                  onSelected: (String value) {
                    String vl=value;
                    if(vl=="edit"){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text("Update Item"),
                          content: TextField(onChanged: (value) {
                            item=value;
                          },),
                          actions: [
                            ElevatedButton(onPressed: (){
                              setState(() {
                                lst[index]=item;
                              });
                              Navigator.pop(context);
                            }, child: const Text("Update")),
                          ],
                        );
                      });
                    }
                    else if(vl=="delete"){
                      setState(() {
                        lst.removeAt(index);
                      });
                    }
                  },),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  //backgroundColor: Colors.black87,
                  title: const Text("Add New Item"),
                  content: TextField(
                    onChanged: (value) {
                      item = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lst.add(item);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Add")),
                  ],
                );
              }));
        },
        child: const Text("Add"),
      ),
    );
  }
}
