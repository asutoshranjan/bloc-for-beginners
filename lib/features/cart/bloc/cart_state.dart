part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final List<ProductDataModel> products;
  final double totalprice;
  CartLoadedSuccessState({required this.totalprice, required this.products});
}

class CartErrorState extends CartState {}


