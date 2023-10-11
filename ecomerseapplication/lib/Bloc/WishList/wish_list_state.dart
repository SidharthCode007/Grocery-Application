part of 'wish_list_bloc.dart';

@immutable
abstract class WishListState {}

abstract class WishlistActionState extends WishListState {}

final class WishListInitial extends WishListState {}

class WishlistLoadingState extends WishListState {}

class WishlistSuccessfulState extends WishListState {
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessfulState({required this.wishlistItems});
}

/* class WishlistRemovedState extends WishListState {
  final ProductDataModel removed
}
 */