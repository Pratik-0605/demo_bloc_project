part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{   //simple inheritance
  
}

class CartRemovefromCartEvent extends CartEvent{
  final ProductDataModel productDataModel;

  CartRemovefromCartEvent({
    required this.productDataModel
  });
}

