
import 'package:class09/sher.dart';
import 'package:flutter/material.dart';

class LTP extends StatefulWidget {
  const LTP({super.key});

  @override
  State<LTP> createState() => _LTPState();
}

class _LTPState extends State<LTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          tile(),
          tile(),
          tile(),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}

Widget tile() {
  return Builder(
    builder: (context) {
      return ListTile(
        leading: const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/saad.jpg"),
        ),
        title: const Text("Saad Hussain Rizvi"),
        subtitle: const Text("Chair person of TLP"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("4:25 PM"),
            CircleAvatar(
              radius: 10,
              child: Text("4"),
            ),
            
          ],

        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sher()));
        },
      );
    }
  );
}
