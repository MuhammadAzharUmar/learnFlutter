import 'dart:async';

import 'package:bloc_implementation/PartOne/InternetBloc/internet_event.dart';
import 'package:bloc_implementation/PartOne/InternetBloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBloc() : super(InternetConnectionInitialState()) {
    on<InternetConnectionLostEvent>(
        (event, emit) => emit(InternetConnectionLostState()));
    on<InternetConnectionGainedEvent>(
        (event, emit) => emit(InternetConnectionGainedState()));
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetConnectionGainedEvent());
      } else {
        add(InternetConnectionLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
