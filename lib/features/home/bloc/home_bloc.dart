import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_shop_app/data/cart_items.dart';
import 'package:bloc_shop_app/data/grocery_data.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent> (homeInitialEvent);
    on<HomeWishListButtonNavigateEvent> (homeWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent> (homeCartButtonNavigateEvent);
    on<HomeProductWishListButtonClickedEvent> (homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent> (homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    log("Initalial loading");
    emit(HomeLoaadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel.fromJson(e)).toList()));
  }

  FutureOr<void> homeWishListButtonNavigateEvent(HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    log("Wishlist");
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    log("Cart");
    emit(HomeNavigateToCartPageActionState());
  }

  

  FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    log("product wishlist clicked");
     wishlistItems.add(event.clickedProduct);
     emit(HomeProductItemWishListedActionState());

  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log("product cart clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartAddedActionState());
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel.fromJson(e)).toList()));
  }
}
