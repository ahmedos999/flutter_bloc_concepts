// ignore_for_file: empty_constructor_bodies

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/router/app_router.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home.dart';

void main() {
  var key;
  runApp(MyApp(
    appRoute: AppRoute(),
    connectivity: Connectivity(),
    key: key,
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  final Connectivity connectivity;

  const MyApp(
      {required Key key, required this.appRoute, required this.connectivity})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity),
          child: Container(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) =>
              CounterCubit(BlocProvider.of<InternetCubit>(context)),
          child: Container(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }
}
