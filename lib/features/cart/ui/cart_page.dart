import 'package:bloc_shop_app/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_shop_app/features/cart/ui/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Cart Items', style: TextStyle(color: Colors.white)),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) {
          return current is CartActionState;
        },
        buildWhen: (previous, current) {
          return current is !CartActionState;
        },
        listener: (context, state) {
          
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case CartLoadedSuccessState:
            final successState = state as CartLoadedSuccessState;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: (successState).products.length,
                      itemBuilder: (context, index) {
                        return CartCard(product: successState.products[index], cartBloc: cartBloc,);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const Text("Total: \$", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                        Text(successState.totalprice.toStringAsPrecision(4), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.green),),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                          
                          }, 
                          child: const Text("Checkout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                  ),
                ],
              );

            default:
            return const SizedBox();
          }
        },
      ),
    );
  }
}
