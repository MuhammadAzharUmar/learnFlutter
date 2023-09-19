import 'package:bloc_implementation/PartThree/FormValidatorBloc/sign_in_bloc.dart';
import 'package:bloc_implementation/PartThree/FormValidatorBloc/sign_in_event.dart';
import 'package:bloc_implementation/PartThree/FormValidatorBloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Form Validation using bloc state management",
        maxLines: 2,
        textAlign: TextAlign.center,
      )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            TextFormField(
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(
                    TextInputValidationEvent(
                        emailController.text, passwordController.text));
              },
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(
                    TextInputValidationEvent(
                        emailController.text, passwordController.text));
              },
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInSubmittionEvent(
                          emailController.text, passwordController.text));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: (state is SignInValidState ||
                            state is SignInLoadingState)
                        ? Colors.blue
                        : Colors.grey),
                child: (state is SignInLoadingState)
                    ? const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                              backgroundColor: Colors.brown,
                            )),
                      )
                    : const Text("Sign in"),
              );
            }),
          ],
        ),
      )),
    );
  }
}
