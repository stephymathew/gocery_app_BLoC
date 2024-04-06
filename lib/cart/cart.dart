import 'package:bloc_project/cart/bloc/cart_bloc_bloc.dart';
import 'package:bloc_project/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _cartState();
}

class _cartState extends State<Cart> {
  final CartBlocBloc cartbloc = CartBlocBloc();
  @override
  void initState() {
    cartbloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("cart items"),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartbloc,
        listener: (context, state) {},
        buildWhen: (previous, current) => current is !CartActionState,
        listenWhen: (previous, current) => current is CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successstate = state as CartSuccessState;
              return ListView.builder(
                itemCount: successstate.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    cartBloc: cartbloc,
                    
                    productDataModel: successstate.cartItems[index],
                  );
                },
              );
              
            default:
          }
          return Container();
        },
      ),
    );
  }
}
