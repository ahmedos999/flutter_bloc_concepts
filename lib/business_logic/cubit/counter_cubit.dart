import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit(this.internetCubit)
      : super(CounterState(counterValue: 0, isIncrement: false)) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(CounterState(
      counterValue: state.counterValue + 1,
      isIncrement: state.isIncrement = true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1,
      isIncrement: state.isIncrement = !true));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
