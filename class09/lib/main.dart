// we use stateless class when during runtime no changes occure
// we use statefull class when during runtime changes occure
import 'package:class09/home.dart'; //importing other page because we have defined and using some classes from it
import 'package:class09/crclavatar.dart'; //importing other page because we have defined and using some classes from it
import 'package:class09/listtile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/* How to call another class 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Home(),//calling another class/page
      ),
    );
  }
}

//creating other class which we will call in our main app
// this class is statefull class
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello, World!")),
    );
  }
}
*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: 
        Container(
          decoration:const BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/002/106/276/small/geometric-black-and-gold-background-free-vector.jpg"),fit: BoxFit.fill)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text("Goto home page"),
                  );
                }),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Crcl()),
                      );
                    },
                    child: const Text("Goto CircleAvatar page"),
                  );
                }),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LTP()),
                      );
                    },
                    child: const Text("Goto ListTile page"),
                  );
                }),
              ],
            ),
          ),
        ), //we have to import home.dart because this class is defined there
      ),
    );
  }
}
