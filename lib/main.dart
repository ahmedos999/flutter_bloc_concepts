// ignore_for_file: empty_constructor_bodies

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/utility/app_bloc_observer.dart';
import 'package:flutter_bloc_concepts/presentation/router/app_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();
  runApp(MyApp(
    appRoute: AppRoute(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  final Connectivity connectivity;

  const MyApp({required this.appRoute, required this.connectivity});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
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
