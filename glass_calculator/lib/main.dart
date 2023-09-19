import 'package:flutter/material.dart';
import 'package:glass_calculator/BMI/constants.dart';
import 'package:glass_calculator/BMI/input_page.dart';
import 'package:glass_calculator/calculator.dart';
import 'package:glass_calculator/glass_calculator.dart';

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
      theme: ThemeData.dark().copyWith(primaryColor: const Color(0xff0A0E21),
      scaffoldBackgroundColor:const Color(0xff0A0E21),
      appBarTheme:const AppBarTheme(backgroundColor: inActiveCardColor)
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title:  TabBar(
                indicatorColor: bottomContainerColor,
                unselectedLabelColor: cardTextColor,
                labelColor: bottomContainerColor,
                tabs:const [
                  Text(
                    "BMI",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "GPC ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
                onTap: (value) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
            body: const TabBarView(children: [InputPage(),Calculator(), Gcalculator()]),
          )),
    );
  }
}
