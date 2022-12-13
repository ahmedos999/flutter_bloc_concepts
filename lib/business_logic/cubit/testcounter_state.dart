part of 'testcounter_cubit.dart';

class TestcounterState extends Equatable {
  List<Product> product;
  TestcounterState({required this.product});

  // TestcounterState copyWith({
  //   required List<Product> products,
  // }) {
  //   return TestcounterState(product: products);
  // }

  @override
  List<Object> get props => [product];
}
