part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final WishList wishList;

  const WishlistLoaded(this.wishList);

  List<Object> get props => [wishList];
}

class WishlistError extends WishlistState {}
