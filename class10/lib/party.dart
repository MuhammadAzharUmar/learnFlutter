import 'package:flutter/material.dart';

class Party extends StatefulWidget {
  final String img;
  const Party({super.key, required this.img});

  @override
  State<Party> createState() => _PartyState();
}

class _PartyState extends State<Party> {
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
            ),),      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.img), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "JOIN TLP",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"))
          ],
        ),
      )),
    );
  }
}
