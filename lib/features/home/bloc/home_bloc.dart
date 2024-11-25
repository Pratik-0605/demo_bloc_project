import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeWishlistButtonNavigateEvent>(
      homeWishlistButtonNavigateEvent);
    on<HomeProductCartButtonClickedEvent>(
      homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
      homeProductWishlistButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(
      homeCartButtonNavigateEvent);
  }
    FutureOr<void> homeWishlistButtonNavigateEvent(
        HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
          log('Navigate to Wishlist');
          emit(HomeNavigatetoWishlistPageActionState());
        }
  
    FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
        log('Cart clicked');
  }
  
    FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
        log('Wishlist clicked');
  }
  
    FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
        log('Navigate to Cart');
        emit(HomeNavigatetoCartPageActionState());
  }
}

