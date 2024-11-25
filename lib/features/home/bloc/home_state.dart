part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

//action state is used when the user want to execute some action later on which will be included in HomeState only.
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

// to load the data from the api it will take some time at that time we are using loading indicator and using this class.
class HomeLoadingState extends HomeState {}

//when ui has been loaded data has been fetched and loading indicator should be removed.
class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

// suppose some error occurs so we have created a error class
class HomeErrorState extends HomeState {}

// Navigate to Wishlist page after clicking on wishlist button
class HomeNavigatetoWishlistPageActionState extends HomeActionState {}

// Navigate to cart page after clicking on cart button
class HomeNavigatetoCartPageActionState extends HomeActionState {}
