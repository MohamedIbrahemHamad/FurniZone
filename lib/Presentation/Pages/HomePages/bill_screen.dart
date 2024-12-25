import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Data/Models/cart_model.dart';
import 'package:furnizone/Logic/cart_cubit/cart_cubit.dart';
import 'package:furnizone/Presentation/Pages/HomePages/cart_screen.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';
import 'package:furnizone/Presentation/Widgets/photo_and_info.dart';
import 'package:furnizone/Presentation/Widgets/subtotal_component.dart';


class BillScreen extends StatelessWidget {
  const BillScreen({super.key});
  static String id = 'Bill';
  @override
  Widget build(BuildContext context) {
    Arguments arg = ModalRoute.of(context)!.settings.arguments as Arguments;

    CartModel cartModel = BlocProvider.of<CartCubit>(context).cartModel;
    final List<Content> cartProduct = cartModel.content!;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is CartIsLoading) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              title: TextStyleWidget(
                text: 'Bill',
                color: Color(0xFF304E3E),
                fontSize: 24,
                fontWeight: FontWeight.bold, fontFamily: 'popins',
              ),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is GetCartItemSuccessfully) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              centerTitle: true,
              title: TextStyleWidget(
                text: 'Bill',
                color: Color(0xFF304E3E),
                fontSize: 24,
                fontWeight: FontWeight.bold, fontFamily: 'popins',
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProduct.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: Container(
                          width: 365,
                          height: 107,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 187, 186, 186),
                                  offset: Offset(10, 10),
                                  spreadRadius: 3,
                                  blurRadius: 8),
                            ],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Row(
                              children: [
                                TextStyleWidget(
                                  text: cartProduct[index].quantity.toString(),
                                  color: Color(0xFF4A628A),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold, fontFamily: 'popins',
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                PhotoAndInfo(
                                  image: cartProduct[index].image!,
                                  title: cartProduct[index].productName ?? '',
                                  moreDetiles:
                                      cartProduct[index].category ?? '',
                                  price: cartProduct[index].price ?? 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SubtotalComponent(
                  arguments: arg,
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: Text('Error')),
          );
        }
      },
    );
  }
}
