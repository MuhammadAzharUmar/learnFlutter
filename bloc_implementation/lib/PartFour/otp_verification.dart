import 'package:bloc_implementation/PartFour/Cubit/auth_cubit.dart';
import 'package:bloc_implementation/PartFour/Cubit/auth_state.dart';
import 'package:bloc_implementation/PartFour/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verfication"),
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
              maxLength: 6,
              controller: otpController,
              decoration: const InputDecoration(
                  hintText: "OTP Code", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
              listener: (context, state) {
                if (state is LoggedInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
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
                } else 
                {
                  return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<PhoneAuthCubit>(context)
                            .verifyOtp(otpController.text.trim());
                      },
                      child: const Text("Verify OTP"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
