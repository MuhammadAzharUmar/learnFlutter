import 'package:flutter/material.dart';

class Crcl extends StatefulWidget {
  const Crcl({super.key});

  @override
  State<Crcl> createState() => _CrclState();
}

class _CrclState extends State<Crcl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
       const CircleAvatar(
         radius: 100,
         // backgroundColor: Colors.amber,//to change background color
         // backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwiFoGKpC1zzLXY7GoTpyKqJPP1KO4aHHPxA&usqp=CAU'),//for background image from internet
         //to use image from assests first add path in pubspec.yaml
         backgroundImage: AssetImage('assets/images/saad.jpg'),
       ),
      
       //now important widget
       //Stack --> content on other content is only possible with stack
       //Align Widget is used to align the the item on screen 
       //positioned widget is only belong to stack widget and used for positioning
       Align(
         alignment: Alignment.centerRight,
         child: Stack(
           children: [
             Container(//this is the first widget here we cannot use positioned widget after this for other we will use positioned widget
               height: 200,
               width: 200,
               color: Colors.amber,
             ),
             Positioned(
               top: 25,left: 25,
               child: Container(
                 height: 150,
                 width: 150,
                 color: Colors.blue,
               ),
             ),
             Positioned( top: 50,left: 50,
               child: Container(
                 height: 100,
                 width: 100,
                 color: Colors.green,
               ),
             ),
           ],
         ),
       ),
        const SizedBox(height: 20,),
       FloatingActionButton(onPressed: (){
         Navigator.pop(context);
       }, child: const Text("Back"),),
          ],
        ),
    );
  }
}
