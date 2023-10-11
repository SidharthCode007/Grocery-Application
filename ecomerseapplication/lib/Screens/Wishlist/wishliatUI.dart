import 'package:ecomerseapplication/Bloc/Cart/cart_bloc.dart';
import 'package:ecomerseapplication/Bloc/WishList/wish_list_bloc.dart';
import 'package:ecomerseapplication/Screens/Wishlist/wishlistWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishListBloc wishListBloc = WishListBloc();
  @override
  void initState() {
    wishListBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<WishListBloc, WishListState>(
        bloc: wishListBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistLoadingState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case WishlistSuccessfulState:
              final successState = state as WishlistSuccessfulState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      productDataModel: successState.wishlistItems[index],
                      wishlistBloc: WishListBloc(),
                    );
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
