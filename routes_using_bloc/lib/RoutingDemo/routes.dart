import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routes_using_bloc/RoutingDemo/Blocs_for_all_three/first_cubit.dart';
import 'package:routes_using_bloc/RoutingDemo/Blocs_for_all_three/second_cubit.dart';
import 'package:routes_using_bloc/RoutingDemo/Blocs_for_all_three/third_cubit.dart';
import 'package:routes_using_bloc/RoutingDemo/error_screen.dart';
import 'package:routes_using_bloc/RoutingDemo/first.dart';
import 'package:routes_using_bloc/RoutingDemo/second.dart';
import 'package:routes_using_bloc/RoutingDemo/third.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/first':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => FirstCubit(), child: const FirstScreen()),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => SecondCubit(), child: const SecondScreen()),
        );
      case '/third':
        final arguments=settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => ThirdCubit(), child:  ThirdScreen(title: arguments["title"],)),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
