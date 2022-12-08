import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, isIncrement: false));

  void increment() => emit(CounterState(
      counterValue: state.counterValue + 1,
      isIncrement: state.isIncrement = true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1,
      isIncrement: state.isIncrement = !true));
}
