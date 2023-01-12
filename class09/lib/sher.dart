import 'package:flutter/material.dart';

class Sher extends StatefulWidget {
  const Sher({super.key});

  @override
  State<Sher> createState() => _SherState();
}

class _SherState extends State<Sher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQc4Mhh5uoh3MDFzOdPfuR1Uwi3HfXb3lC2A&usqp=CAU'),fit: BoxFit.fill)),),
    );
  }
}
