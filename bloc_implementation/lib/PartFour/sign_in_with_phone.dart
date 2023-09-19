import 'package:bloc_implementation/PartFour/Cubit/auth_cubit.dart';
import 'package:bloc_implementation/PartFour/Cubit/auth_state.dart';
import 'package:bloc_implementation/PartFour/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({super.key});

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn with Phone"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 10,
              controller: phoneNumberController,
              decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "🇵🇰",
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  enabled: true,
                  prefixStyle: TextStyle(color: Colors.black),
                  hintText: "Phone Number",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
              listener: (context, state) {
                if (state is OtpSentState) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OtpVerification()
                  ));
                } else if (state is ErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ElevatedButton(
                      onPressed: () {
                        String phoneNumber =
                            "+92${phoneNumberController.text.trim()}";
                        BlocProvider.of<PhoneAuthCubit>(context)
                            .sendOtp(phoneNumber);
                      },
                      child: const Text("Send Code"));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
