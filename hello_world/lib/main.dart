//importing package from where we will use other widgets
import 'package:flutter/material.dart';

//creation of class MyApp that will inherit the properties statelessWidget class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //here we will return MaterialApp widget that is main framework/app
    return MaterialApp(
      //material app have a property home where we will initilize our main page of app
      //Scafolld is just an empty page for our app
      home: Scaffold(
        //scafolld is a page and as we know each page have some body so
        //scafolld have body property where we can define anything
        //here we use column to show multiple item on screen vertically
        body: Column(
          //column take children as we want to add multiple item so that's why
          children: const <Widget> [//here for demonstration we have used two text widgets to show vertically on screen
            Text("My name Is : Muhammad Azhar"),
            Text("My Email Is : azhar03067104663@gmail.com"),
          ],
        ),
      ),
    );
  }
}

//now we will call our app in main method of dart
//runApp is prebuild widget of flutter material.dart package
//MyApp() is our application
void main(){
  runApp(const MyApp());
}