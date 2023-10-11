part of 'wish_list_bloc.dart';

@immutable
abstract class WishListEvent {}

class WishlistInitialEvent extends WishListEvent {}

class WishlistRemoveButtonclickedEvent extends WishListEvent {
  final ProductDataModel removedproduct;

  WishlistRemoveButtonclickedEvent({required this.removedproduct});
}
