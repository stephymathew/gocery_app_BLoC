part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

abstract class CartActionState extends CartBlocState {}

class CartInitial extends CartBlocState {}

class CartSuccessState extends CartBlocState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}
