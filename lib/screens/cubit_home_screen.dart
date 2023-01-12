

import 'package:bloc_internet_connectivity/bloc/internet-bloc/internet_state.dart';
import 'package:bloc_internet_connectivity/cubit/internet_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/internet_cubit.dart';

class CubitHomeScreen extends StatelessWidget {
  const CubitHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Connectivity'),
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetStatesEnum>(
          /// difference b/w "==" and "is"
          /// both are used for comparison but;
          /// '==' to check values e.g: int a=2; int b=5; if(a==b) --> false
          /// 'is' to check data type;  e.g: if(a is int){}  we can not do like this if(a == int)
          builder: (context, state) {
            print('builder state: ${state}');
            if(state == InternetStatesEnum.lost){
              return Text('Not Connected!');
            } else if(state == InternetStatesEnum.gained){
              return Text('Connected!');
            } else {
              return Text('Loading...');
            }
          },
          listener: (context, state){
            print('listen state: $state');
            if(state == InternetStatesEnum.gained){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connected to internet'),
                ),
              );
            }
            if(state == InternetStatesEnum.lost){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No Internet'),
                ),
              );
            }
          },

        ),
      ),
    );
  }
}
