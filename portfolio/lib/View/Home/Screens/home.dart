import 'package:flutter/material.dart';
import 'package:portfolio/Utlities/colors.dart';
import 'package:portfolio/View/Home/Screens/personal_cv.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 2,
            child: PersonalCV(),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: kbgColor,
            ),
          ),
        ],
      ),
    );
  }
}
