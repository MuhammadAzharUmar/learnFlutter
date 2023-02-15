import 'package:class13firebaseauth/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  login() async {
    setState(() {
      loading = true;
    });
    final email = emailController.text;
    final password = passwordController.text;
    if (email == "" || password == "") {
      final snackbar = SnackBar(
        content: const Text("Please fill all the above data fields!"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      try{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot snapshot =
          await firestore.collection("Users").doc(user.user!.uid).get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      // ignore: avoid_print
      print(data['username']);
            homepage(user.user!.uid);
                  emailController.text = "";
      passwordController.text = "";
      }catch(e){
        final snackbar=SnackBar(content:  Text(e.toString()),
        action: SnackBarAction(label: 'Undo',onPressed: (){},),);
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }


    }
    setState(() {
      loading = false;
    });
  }

  homepage(String data) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home(uid: data)));
    // Navigator.pushNamed(context, '/home',arguments: data);
  }

  registerpage() {
    Navigator.pushNamed(context, '/register');
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.amber,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
            ),
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .3,
                  child: Image.asset('assets/login.png'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: "Enter Your Email",
                      labelStyle: TextStyle(
                          backgroundColor: Colors.white, color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: "Enter Your Password",
                      labelStyle: TextStyle(
                          backgroundColor: Colors.white, color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: Icon(Icons.password),
                      filled: true,
                      fillColor: Colors.white),
                  obscureText: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: login,
                        style: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.amber),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                side: const BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        child: const Text("login")),
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      width: MediaQuery.of(context).size.width * .70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have an account?",
                            style: TextStyle(
                                color: Colors.amber,
                                backgroundColor: Colors.black),
                          ),
                          GestureDetector(
                              onTap: registerpage,
                              child: const Text(
                                "\t\t\tClick Here",
                                style: TextStyle(
                                    color: Colors.blue,
                                    backgroundColor: Colors.black),
                              )),
                        ],
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
