import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Data/APIs/Dio_Consumer.dart';
import 'package:furnizone/Data/Models/cart_model.dart';
import 'package:furnizone/Logic/cart_cubit/cart_cubit.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';
import 'package:furnizone/Presentation/Widgets/checkout_price_component.dart';
import 'package:furnizone/Presentation/Widgets/component_of_cart.dart';
import 'package:furnizone/Presentation/Widgets/icon_button_style.dart';


class CartScreen extends StatelessWidget {
  CartScreen({super.key}) {}
  static String id = 'Cart';

  final DioConsumer apiConsumer = DioConsumer(
    dio: Dio(),
  );
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartCubit>(context).GetCartItems();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartIsLoading) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: TextStyleWidget(
                text: 'Cart',
                color: Color(0xFF304E3E),
                fontSize: 24,
                fontWeight: FontWeight.bold, fontFamily: 'popins',
              ),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is NoCartItem) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: TextStyleWidget(
                text: 'Cart',
                color: Color(0xFF304E3E),
                fontSize: 24,
                fontWeight: FontWeight.bold, fontFamily: 'popins',
              ),
            ),
            body: Center(child: Text('No item')),
          );
        }
        if (state is GetCartItemSuccessfully) {
          CartModel cartModel = BlocProvider.of<CartCubit>(context).cartModel;
          final List<Content> cartProduct = cartModel.content!;

          double totalPrice = 0.0;
          int totalItems = 0;

          for (var item in cartProduct) {
            totalPrice += item.price!;
            totalItems += item.quantity!;
          }
          Arguments arg = Arguments(totalPrice, totalItems);
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: TextStyleWidget(
                text: 'Cart',
                color: Color(0xFF304E3E),
                fontSize: 24,
                fontWeight: FontWeight.bold, fontFamily: 'popins',
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: IconButtonStyle(
                    iconColor: Color(0xFF304E3E),
                    iconShape: FontAwesomeIcons.trashCan,
                    iconSize: 25,
                    buttonWidth: 50,
                    buttonHeight: 50,
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).DeleteAll();
                    },
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProduct.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ComponentOfCart(
                        index: index,
                        quantity: cartProduct[index].quantity!,
                        image: cartProduct[index].image!,
                        title: cartProduct[index].productName ?? '',
                        moreDetiles: cartProduct[index].category ?? '',
                        price: cartProduct[index].price ?? 0,
                      );
                    },
                  ),
                ),
                CheckoutPriceComponent(
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

class Arguments {
  double? totalPrice;
  int? totalItem;
  Arguments(this.totalPrice, this.totalItem);
}
