import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });
    test('Check if the value equal zero', () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, isIncrement: false));
    });

    blocTest('this is a test for the incremant function',
        build: () => counterCubit,
        act: (cubit) => cubit.increment(),
        expect: () => [CounterState(counterValue: 1, isIncrement: true)]);

    blocTest('this is a test for the decremant function',
        build: () => counterCubit,
        act: (cubit) => cubit.decrement(),
        expect: () => [CounterState(counterValue: -1, isIncrement: false)]);
  });
}
