import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), //our app theme
      title: "Login Page",
      debugShowCheckedModeBanner: false,
      //main page start
      home: Scaffold(
        //defining our app bar basic
        appBar: AppBar(
          title: const Center(child: Text("Login Page")),
        ),

        body: SingleChildScrollView(
          //to make page scroll able
          child: Column(
            children: [
              const Center(
                child: Text("Row And Column Plus container widget practice"),
              ),
              const SizedBox(
                height: 50,
              ),
              //practicing row and column widget
              Container(
                alignment: Alignment.topCenter, //place container at topcenter
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.tealAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: const Text("A"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //now login page design
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text("Login UI Design Using Basic Widget"),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.blueGrey,
                height: 500,
                width: 300,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      height: 50,
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          hintText: "Enter your Email",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      height: 50,
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.password_outlined),
                          hintText: "Enter your Password",
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Login Here"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
