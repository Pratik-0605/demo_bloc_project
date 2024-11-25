import 'package:bloc_project_akshit/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,                          // It is a parameter which is going to take homebloc
      // listenWhen: (previous, current) {},
      // buildWhen: (previous, current) {},
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Pratik Grocery App',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(onPressed: () {
                homeBloc.add(HomeWishlistButtonNavigateEvent());
              }, icon: Icon(Icons.favorite_outline)),
              IconButton(onPressed: () {
                homeBloc.add(HomeCartButtonNavigateEvent());
              }, icon: Icon(Icons.shopping_bag_outlined)),
            ],
            backgroundColor: Colors.indigo[400],
          ),
        );
      },
    );
  }
}
