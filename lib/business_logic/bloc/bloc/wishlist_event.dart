part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWithList extends WishlistEvent {}

class AddToWithList extends WishlistEvent {
  final Product product;

  const AddToWithList(this.product);

  List<Object> get props => [product];
}

class RemoveFromWithList extends WishlistEvent {
  final Product product;

  const RemoveFromWithList(this.product);

  List<Object> get props => [product];
}
