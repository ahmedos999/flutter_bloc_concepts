import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/router/app_router.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoute _appRoute = AppRoute();

  // This widget is the root of your application.
  @override
  void dispose() {
    // TODO: implement dispose

    _appRoute.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRoute.onGenerateRoute,
    );
  }
}
