import 'package:bloc_project/cart/bloc/cart_bloc_bloc.dart';
import 'package:bloc_project/home/models/homeprroductdatamodel.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBlocBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsetsDirectional.all(10),
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
         const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "\$ " + productDataModel.price.toString(),
                style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    // homeBloc.add(HomeProductWishListButtonClickedEvent(
                    //   clickedProduct: productDataModel
                    // ));
                  },
                  icon: const Icon(
                    Icons.favorite_outline,
                  )),
              IconButton(
                  onPressed: () {
                    // homeBloc.add(HomeCartButtonNavigateEvent());
                    // homeBloc.add(HomeProductCartButtonClickedEvent(
                    //   clickedProduct: productDataModel
                    // ));
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
