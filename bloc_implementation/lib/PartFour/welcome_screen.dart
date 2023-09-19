import 'package:bloc_implementation/PartFour/Cubit/auth_cubit.dart';
import 'package:bloc_implementation/PartFour/Cubit/auth_state.dart';
import 'package:bloc_implementation/PartFour/sign_in_with_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Phone Number Authentication Successfull"),
          const SizedBox(
            height: 30,
          ),
          BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
            listener: (context, state) {
              if (state is LoggedOutState) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInWithPhone(),
                    ));
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<PhoneAuthCubit>(context).logout();
                  },
                  child: const Text("Logout"));
            },
          ),
        ],
      ),
    );
  }
}
