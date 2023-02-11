// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  getdata() async {
    var list = [];
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
    var data = await jsonDecode(response.body);
    for (var i in data) {
      Myuser user = Myuser(i['username'], i['email']);
      list.add(user);
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
          return const  Center(child: CircularProgressIndicator(color: Colors.amber),);
          }else if (snapshot.data == null) {
            return const Center(
              child: Text("NO DATA AVAILABLE"),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("username: ${snapshot.data[index].username}"),
                    subtitle: Text("username: ${snapshot.data[index].email}"),
                  );
                });
          }
        });
  }
}

class Myuser {
  var username;
  var email;
  //constructor
  Myuser(this.username, this.email);
}
