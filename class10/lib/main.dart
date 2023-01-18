import 'package:class10/home.dart';
import 'package:class10/listviewbuilder.dart';
import 'package:class10/grdvw.dart';
import 'package:class10/grdVwCount.dart';
import 'package:class10/grdvwbldr.dart';
import 'package:class10/setstate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
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
            ),
            bottom: const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: "TLP FLAG"),
                Tab(text: "TLP Chair Person"),
              ],
            ),
          ),
          drawer: Drawer(
              backgroundColor: Colors.blueGrey[50],
              child: Column(
                children: [
                  DrawerHeader(
                    child: Stack(
                      children: const [
                        Image(
                          image: AssetImage('assets/DH.jpg'),
                          width: 300,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Text(
                            "ISLAM ZINDABAD",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.handshake_rounded),
                    ),
                    title: const Text("ListView"),
                    subtitle: const Text("How To use ListView"),
                    trailing: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home())),
                        child: const Icon(Icons.navigate_next),
                      );
                    }),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                        radius: 20, child: Icon(Icons.handshake_rounded)),
                    title: const Text("ListView.Builder"),
                    subtitle: const Text("How To use ListView.builder"),
                    trailing: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LstVBuilder())),
                        child: const Icon(Icons.navigate_next),
                      );
                    }),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                        radius: 20, child: Icon(Icons.handshake_rounded)),
                    title: const Text("GridView"),
                    subtitle: const Text("How To use GridView"),
                    trailing: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GrdVw())),
                        child: const Icon(Icons.navigate_next),
                      );
                    }),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.handshake_rounded),
                    ),
                    title: const Text("GridView.Count"),
                    subtitle: const Text("How To use GridView.count"),
                    trailing: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GrdVwCount())),
                        child: const Icon(Icons.navigate_next),
                      );
                    }),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.handshake_rounded),
                    ),
                    title: const Text("GridView.Builder"),
                    subtitle: const Text("How To use GridView.Builder"),
                    trailing: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GrdVwBldr())),
                        child: const Icon(Icons.navigate_next),
                      );
                    }),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.handshake_rounded),
                    ),
                    title: const Text("SetState((){})"),
                    subtitle: const Text(
                        "Simple State Management to change value dynamically"),
                    trailing: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MySetState())),
                        child: const Icon(Icons.navigate_next),
                      );
                    }),
                  ),
                ],
              )),
         
          body: const TabBarView(
            children: [
              Page1(),
              Page2(),
            ],
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/flag.png'), fit: BoxFit.fill),
      ),
    ));
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/SAAD1.png'), fit: BoxFit.fill),
      ),
    ));
  }
}
