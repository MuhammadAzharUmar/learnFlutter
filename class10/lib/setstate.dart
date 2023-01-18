import 'package:flutter/material.dart';

class MySetState extends StatefulWidget {
  const MySetState({super.key});

  @override
  State<MySetState> createState() => _MySetStateState();
}

class _MySetStateState extends State<MySetState> {
 
  var _currentindex = 0;
  var tablist = [
   const MySetStatee(),
   const Center(child: Text("اللہ کی طرف سیدھا راستہ تلاش کریں۔",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
   const Center(child: Text("ابے شک اللہ ہر چیز کو دیکھ رہا ہے۔۔",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
   const Center(child: Text("بے شک ہم اللہ کے ہیں اور ایک دن ہم اللہ کی طرف لوٹائے جائیں گے۔",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),

  ];
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              backgroundColor: Colors.black,
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              backgroundColor: Colors.grey,
              label: "Camera"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Colors.brown,
            label: "Person",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: tablist[_currentindex],
    );
  }
}

class MySetStatee extends StatefulWidget {
  const MySetStatee({super.key});

  @override
  State<MySetStatee> createState() => _MySetStateeState();
}

class _MySetStateeState extends State<MySetStatee> {
   var no = "";
  void one() {
    setState(() {
      no = "100";
    });
  }

  void two() {
    setState(() {
      no = "200";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You Have Pressed $no",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: one, child: const Text("100")),
            ElevatedButton(onPressed: two, child: const Text("200")),
          ],
        ),
      ),
    );
  }
}