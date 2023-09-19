/*
 * cubits only return state there is no need of event add cause it use function structure 
 * benefits are less code and also we can emit state multiple time
 * 
 * also if there is no data in State we can use enum instead of classes for state
 * 
 */
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState { initial, lost, gained }

// now we will create cubit of type internetState there is no event there

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? subscription;
  InternetCubit() : super(InternetCubitState.initial) {
    subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetCubitState.gained);
      } else {
        emit(InternetCubitState.lost);
      }
    });
  }
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
