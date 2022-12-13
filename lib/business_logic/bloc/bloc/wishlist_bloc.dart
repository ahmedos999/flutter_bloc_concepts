import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_concepts/data/models/product_model.dart';

import '../../../data/models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    // ignore: void_checks
    on<StartWithList>((event, emit) {
      _mapStartwishListToState();
    });
    // ignore: void_checks
    on<AddToWithList>((event, emit) {
      event.product.id = 0;
      event.product.name = 'a';
    });
    // ignore: void_checks
    on<RemoveFromWithList>((event, emit) async* {
      yield* _mapRemoveFromWishListToState(event, state);
    });
  }

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWithList) {
      yield* _mapStartwishListToState();
    } else if (event is AddToWithList) {
      yield* _mapAddTowishListToState(event, state);
    } else if (event is RemoveFromWithList) {
      yield* _mapRemoveFromWishListToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartwishListToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddTowishListToState(
      AddToWithList event, WishlistState state) async* {
    print('object2');
    if (state is WishlistLoaded) {
      print('object3');
      try {
        yield WishlistLoaded(WishList(
            WishListProducts: List.from(state.wishList.WishListProducts)
              ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveFromWishListToState(
      RemoveFromWithList event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(WishList(
            WishListProducts: List.from(state.wishList.WishListProducts)
              ..remove(event.product)));
      } catch (_) {}
    }
  }
}
