import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project_akshit/data/cart_items.dart';
import 'package:bloc_project_akshit/features/home/models/home_product_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);                                     //on this CartInitialevent i want to run the cartInitialEventfunction
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }
}
