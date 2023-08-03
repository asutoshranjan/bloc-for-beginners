import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    double totalprice = 0;
    for (var item in cartItems) {
      totalprice += item.price;
    }
    log(totalprice.toString());
    emit(CartLoadedSuccessState(totalprice: totalprice, products: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.clickedProduct);
    double totalprice = 0;
    for (var item in cartItems) {
      totalprice += item.price;
    }
    log(totalprice.toString());
    emit(CartLoadedSuccessState(totalprice: totalprice, products: cartItems));
  }
}
