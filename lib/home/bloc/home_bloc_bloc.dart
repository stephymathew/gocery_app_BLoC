import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_items.dart';
import 'package:bloc_project/data/gocery_data.dart';
import 'package:bloc_project/data/wishlist_item.dart';

import 'package:bloc_project/home/models/homeprroductdatamodel.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: Grocery.groceryProduct
            .map((e) => ProductDataModel(
                id: e["id"] ?? 0,
                name: e["name"] ?? "",
                description: e["description"] ?? "",
                price: e["price"] ?? 0.0,
                imageUrl: e["imageUrl"] ?? ""))
            .toList()));

    // final List<ProductDataModel> products = Grocery.groceryProduct
    //     .map((e) => ProductDataModel(
    //           id: e['id'] ?? 0, // Add null check here
    //           name: e['name'] ?? '', // Add null check here
    //           description: e['description'] ?? '', // Add null check here
    //           price: e['price'] ?? 0.0, // Add null check here
    //           imageUrl: e['imageUrl'] ?? '', // Add null check here
    //         ))
    //     .toList();
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("wishlist clicked");
    wishlistitems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("shopping cart clicked");
    cartitems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist navigate click");

    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("cart navigate click");
    emit(HomeNavigateToCartpageActionState());
  }
}
