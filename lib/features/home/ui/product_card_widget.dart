import 'package:bloc_shop_app/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../models/home_product_data_model.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel product;
  final HomeBloc homeBloc;
  const ProductCard({super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(4, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            color: Colors.grey[100],
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(product.name, style: const TextStyle(fontSize: 20),),
          Text(product.description, style: const TextStyle(fontSize: 16),),
          Row(
            children: [
              Text("Price \$${product.price.toString()}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green),),
              const Spacer(),
              IconButton(
                onPressed: (){
                  homeBloc.add(HomeProductWishListButtonClickedEvent());
                }, 
                icon: const Icon(Icons.favorite_border)),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductCartButtonClickedEvent());
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
