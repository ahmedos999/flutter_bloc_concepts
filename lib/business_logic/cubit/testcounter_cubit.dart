import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/expect.dart';

import '../../data/models/product_model.dart';

part 'testcounter_state.dart';

class TestcounterCubit extends Cubit<TestcounterState> {
  TestcounterCubit() : super(TestcounterState(product: [Product(1, "2")]));

  // void add(id, name) {
  //   state.product.add(Product(id, name));
  //   emit(TestcounterState(product: state.product));
  // }
  void incementcount(id, name) {
    emit(TestcounterState(
        product: List.from(state.product)..add(Product(id, name))));
  }
}
