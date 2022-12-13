import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_concepts/data/models/product_model.dart';

class WishList extends Equatable {
  final List<Product> WishListProducts;

  const WishList({this.WishListProducts = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [WishListProducts];
}
