import 'package:bloc_project_akshit/features/cart/ui/cart.dart';
import 'package:bloc_project_akshit/features/home/bloc/home_bloc.dart';
import 'package:bloc_project_akshit/features/home/ui/product_tile_widget.dart';
import 'package:bloc_project_akshit/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc, // It is a parameter which is going to take homebloc
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigatetoCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigatetoCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
        else if (state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Carted')));    // It will show a popup that item added to cart
        }
        else if (state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Wishlisted')));  //// It will show a popup that item added to wishlist
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
          final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text(
                  'Pratik Grocery App',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                return ProductTileWidget(
                  homeBloc: homeBloc,
                  productDataModel: successState.products[index]);
              }),
            );

          case HomeErrorState:
          return const Scaffold(
            body: Center(
              child: Text("Error")
            )
          );
          default:
            return SizedBox();
        }
      },
    );
  }
}
