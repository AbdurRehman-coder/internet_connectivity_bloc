
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// In cubit there is no event, it consist of only States and simple functions
/// The [State] are actually empty classes so if class has no properties and methods so
/// its better to use the [enum] instead of classes in these scenarios
enum InternetStatesEnum{initial, lost, gained}

class InternetCubit extends Cubit<InternetStatesEnum>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetStatesEnum.initial){

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile){
        emit(InternetStatesEnum.gained);
      } else {
        emit(InternetStatesEnum.gained);
      }
    });

  }
  /// close stream and controllers here in close [built-in] function
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }

}