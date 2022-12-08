part of 'testcounter_cubit.dart';

class TestcounterState extends Equatable {
  List<Product> product;
  int count;
  TestcounterState({required this.product, required this.count});

  @override
  List<Object> get props => [product, count];
}
