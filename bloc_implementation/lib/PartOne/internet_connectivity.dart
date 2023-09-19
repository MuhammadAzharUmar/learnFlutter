// import 'package:bloc_implementation/PartOne/InternetBloc/internet_bloc.dart';
// import 'package:bloc_implementation/PartOne/InternetBloc/internet_state.dart';
import 'package:bloc_implementation/PartFour/Cubit/auth_cubit.dart';
import 'package:bloc_implementation/PartFour/Cubit/auth_state.dart';
import 'package:bloc_implementation/PartFour/sign_in_with_phone.dart';
import 'package:bloc_implementation/PartFour/welcome_screen.dart';
import 'package:bloc_implementation/PartThree/sign_in.dart';
import 'package:bloc_implementation/PartTwo/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnectivity extends StatefulWidget {
  const InternetConnectivity({super.key});

  @override
  State<InternetConnectivity> createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BLOC Overview"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.cyan.shade900,
        ),
        backgroundColor: Colors.white,

        // Using Bloc

        /**
         * here we have three option to use bloc
         * 1-> we can use BlocBuilder
         *    it is used to build ui on screen it listen the state and build ui
         * 2-> we can use BlocListner
         *    it is used to show message or popup or snackbar etc it isten the state in background and act when state change
         * 3-> we can use BlocConsumer 
         *    it is used for both to build ui using builder parameter and also to listen in background to show pop-up etc
         */
        // body: Center(
        //   child: BlocBuilder<InternetBloc, InternetState>(
        //       builder: (context, state) {
        //     if (state is InternetConnectionGainedState) {
        //       return const Text("Internet Connected");
        //     } else if (state is InternetConnectionLostState) {
        //       return const Text("Internet Connection Lost");
        //     } else {
        //       return const Text("Loading... ");
        //     }
        //   }),
        // ),
        // body: Center(
        //   child: BlocConsumer<InternetBloc, InternetState>(
        //       listener: (context, state) {
        //     if (state is InternetConnectionGainedState) {
        //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //         content: Text("Internet Connected"),
        //         backgroundColor: Colors.green,
        //         duration: Duration(seconds: 2),
        //       ));
        //     } else if (state is InternetConnectionLostState) {
        //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //         content: Text("Internet Connection Lost"),
        //         backgroundColor: Colors.red,
        //         duration: Duration(seconds: 2),
        //       ));
        //     }
        //   }, builder: (context, state) {
        //     if (state is InternetConnectionGainedState) {
        //       return const Text("Internet Connected");
        //     } else if (state is InternetConnectionLostState) {
        //       return const Text("Internet Connection Lost");
        //     } else {
        //       return const Text("Loading... ");
        //     }
        //   }),
        // ),

        // Using Cubit
//here in cubit to check state we will use == instead of "is" because we want to check value not datatype
        body: Center(
          child: BlocConsumer<InternetCubit, InternetCubitState>(
              listener: (context, state) {
            if (state == InternetCubitState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ));
            } else if (state == InternetCubitState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connection Lost"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ));
            }
          }, builder: (context, state) {
            if (state == InternetCubitState.gained) {
              return const Text("Internet Connected");
            } else if (state == InternetCubitState.lost) {
              return const Text("Internet Connection Lost");
            } else {
              return const Text("Loading... ");
            }
          }),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignInForm(),
                  ));
                },
                child: const Text("Sign in")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocBuilder<PhoneAuthCubit,PhoneAuthState>(
                      //only when app start  then build
                      buildWhen: (previous, current) {
                        return previous is PhoneAuthInitialState;
                      },
                      //check where to go
                      builder: (context, state) {
                        if (state is LoggedInState) {
                          return const WelcomeScreen();
                        } else {
                          return const SignInWithPhone();
                        }
                      },
                    ),
                  ));
                },
                child: const Text("Phone Verification")),
          ],
        ),
      ),
    );
  }
}
