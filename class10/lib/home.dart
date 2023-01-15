import 'package:class10/more.dart';
import 'package:class10/party.dart';
// import 'package:class10/party.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Center(
              child: Text(
                "تحریک لبیک پاکستان",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),),
      body: ListView(
        children: [
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
          const SizedBox(
            height: 5,
          ),
          tlp(),
        ],
      ),
    );
  }
}

Widget tlp() {
  return Container(
    color: Colors.blueGrey,
    height: 100,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 90,
            width: 90,
            color: Colors.blueGrey,
            child: Stack(children: const [
              CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFcMMLG1zlIGNftG9arKoJD3YdUFIzxnvWNQ&usqp=CAU')),
              Positioned(
                bottom: 15,
                right: 15,
                child: Image(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZAiX13NGujEPdvLQOK8JBN-M3tdYjDrENng&usqp=CAU'),
                  fit: BoxFit.fill,
                  height: 20,
                  width: 30,
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Party(
                              img:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT62W3K2jMaePBH5uwXfxOeMVogZqeSQBIStg&usqp=CAU',
                            )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text(
                    "Hafiz Saad Hussan Rizvi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ChairPerson Of TLP",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            );
          }),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Text("12:00 AM"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.green,
                child: Text("12"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Builder(builder: (context) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const More()));
                },
                child: const Icon(Icons.more_vert));
          }),
        ),
      ],
    ),
  );
}
