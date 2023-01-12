import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container styling
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
            //for container decoration we use box decoration
            //if we are using box decoration we will define color inside that
            decoration: BoxDecoration(
              color: Colors.blueAccent, //for color
              borderRadius: BorderRadius.circular(
                  20), //border of container will be rounded by  20px
              border: Border.all(
                  width: 3,
                  color:
                      Colors.green), //using border of green color with 3px width
              // gradient: LinearGradient(
              //     colors: [Colors.red, Colors.green, Colors.blue],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     ),
              // gradient: RadialGradient(colors: [Colors.red,Colors.green],
              // center: Alignment.topLeft,),
              // gradient: SweepGradient(colors: [Colors.yellow,Colors.green,Colors.blueGrey,Colors.amber],
              // center: Alignment.bottomCenter,)
            ),
    
            //padding is space from inside
            //Padding in container two ways
            //   //1st
            padding: const EdgeInsets.all(20),
            //   //2nd
            // padding:const EdgeInsets.only(left: 20,top: 5),
            //Margin is space from outside the container
            //also we can use both ways
            // //1st
            // margin:const EdgeInsets.all(20),
            // //2nd
            // margin:const EdgeInsets.only(top: 5,left: 5),
    
            child: const Text("Box Decoration"),
          ),
    
          //here is another widget align used to align anything any where on screen
          Align(
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Text(
                "Hello,World!",
                // style: TextStyle(
                //   color: Colors.black,
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold,
                // ),
                //download and add in pubspecfile and then use
              ),
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
