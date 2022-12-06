part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool isIncrement;
  CounterState({required this.counterValue, required this.isIncrement});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, isIncrement];
}
