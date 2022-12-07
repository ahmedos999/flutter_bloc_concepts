import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third.dart';

class AppRoute {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: HomeScreen(title: 'Home 1'),
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: SecScreen(title: 'Home 2')));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: ThirdScreen(title: 'Home 3')));
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.isClosed;
  }
}
