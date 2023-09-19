import 'package:bloc_implementation/PartFour/Cubit/auth_cubit.dart';
import 'package:bloc_implementation/PartOne/InternetBloc/internet_bloc.dart';
import 'package:bloc_implementation/PartOne/internet_connectivity.dart';
import 'package:bloc_implementation/PartThree/FormValidatorBloc/sign_in_bloc.dart';
import 'package:bloc_implementation/PartTwo/internet_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => InternetBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => InternetCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignInBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => PhoneAuthCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InternetConnectivity(),
      ),
    );
  }
}
