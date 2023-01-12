
import 'dart:async';
import 'dart:developer';

import 'package:bloc_internet_connectivity/bloc/internet-bloc/internet_event.dart';
import 'package:bloc_internet_connectivity/bloc/internet-bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{

  /// Connectivity
   Connectivity _connectivity = Connectivity();
   StreamSubscription? connectivitySubscription;

  /// super is used to call the Parent [Bloc] class constructor or extended class constructor
  /// which is Bloc in this case, We provide InitialState to the Bloc
  InternetBloc() : super(InternetInitialState()){
    /// [on<>(() => )] is used for event checking/comparison that which event is triggered
    on<InternetLostEvent>((event, emit) {
      emit(InternetLostState());
    });
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    /// Listen for internet connectivity
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      log('connectivity event: $result');
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      } else{
        add(InternetLostEvent());
      }
    });

  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}