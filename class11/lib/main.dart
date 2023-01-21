import 'package:class11/calculator.dart';
import 'package:class11/todo.dart';
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
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.black)),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Center(child:  Text("Calculator")),
              bottom: const TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.amber,
                  indicatorColor: Colors.amber,
                  tabs: [
                    Tab(
                      text: "Calculator",
                    ),
                    Tab(
                      text: "TODO",
                    ),
                  ]),
                  
            ),
            body: const TabBarView(children: [
              Calculator(),
              Todo(),
            ]),
          ),
          ),
    );
  }
}
