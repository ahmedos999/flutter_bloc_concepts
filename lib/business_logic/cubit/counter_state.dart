// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool isIncrement;
  CounterState({required this.counterValue, required this.isIncrement});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, isIncrement];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'isIncrement': isIncrement,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      isIncrement: map['isIncrement'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    print(counterValue);
    return super.toString();
  }
}
