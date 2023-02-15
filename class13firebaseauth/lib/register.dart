import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  register() async {
    setState(() {
      loading = true;
    });
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    if (username == "" || email == "" || password == "") {
      final snackbar = SnackBar(
        content: const Text("Please fill all the above data fields!"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        Map<String, dynamic> data = {
          "username": username,
          "email": email,
        };
        await firestore.collection("Users").doc(user.user!.uid).set(data);
        loginpage();
        usernameController.text = "";
        emailController.text = "";
        passwordController.text = "";
      } catch (e) {
        final snackbar = SnackBar(
          content: Text(e.toString()),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
    // ignore: avoid_print
    print(emailController.text);
    setState(() {
      loading = false;
    });
  }

  loginpage() {
    Navigator.pushNamed(context, '/login');
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
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .2,
                  child: Image.asset('assets/register.png'),
                ),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelText: "Enter Your Username",
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
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: "Enter Your Email",
                      labelStyle: TextStyle(
                          backgroundColor: Colors.white, color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: Icon(Icons.email),
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
                    ? const CircularProgressIndicator(
                        color: Colors.lightGreen,
                      )
                    : ElevatedButton(
                        onPressed: register,
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
                        child: const Text("Register")),
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
                            "Already Have an account?",
                            style: TextStyle(
                                color: Colors.amber,
                                backgroundColor: Colors.black),
                          ),
                          GestureDetector(
                              onTap: loginpage,
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
