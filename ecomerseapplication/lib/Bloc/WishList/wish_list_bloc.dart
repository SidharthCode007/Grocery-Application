import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomerseapplication/DataBase/wishListData.dart';
import 'package:ecomerseapplication/Model/ProductDataModel.dart';
import 'package:meta/meta.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveButtonclickedEvent>(wishlistRemoveButtonclickedEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishListState> emit) async {
    emit(WishlistLoadingState());
    emit(WishlistSuccessfulState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveButtonclickedEvent(
      WishlistRemoveButtonclickedEvent event, Emitter<WishListState> emit) {
    wishlistItems.remove(event.removedproduct);
    emit(WishlistSuccessfulState(wishlistItems: wishlistItems));
  }
}
