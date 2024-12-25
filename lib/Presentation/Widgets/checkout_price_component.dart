import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Logic/cart_cubit/cart_cubit.dart';
import 'package:furnizone/Presentation/Pages/HomePages/bill_screen.dart';
import 'package:furnizone/Presentation/Pages/HomePages/cart_screen.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';

class CheckoutPriceComponent extends StatelessWidget {
  const CheckoutPriceComponent({super.key, required this.arguments});
  final Arguments arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        color: Colors.white,
      ),
      alignment: Alignment.bottomCenter,
      height: 185,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TextStyleWidget(
                    text: 'Total (${arguments.totalItem} Items)',
                    color: Color(0xFF7791BB),
                    fontSize: 18,
                    fontWeight: FontWeight.normal, fontFamily: 'popins',
                  ),
                  Spacer(),
                  TextStyleWidget(
                    text: '${arguments.totalPrice}',
                    color: Color(0xFF4A628A),
                    fontSize: 18,
                    fontWeight: FontWeight.w800, fontFamily: 'popins',
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButtonStyle(
              title: 'Proceed to checkout',
              fontSize: 16,
              widthElevatedButton: 270,
              heightElevatedButton: 55,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  BillScreen.id,
                  arguments: arguments,
                );

                BlocProvider.of<CartCubit>(context).GetCartItems();
              },
            )
          ],
        ),
      ),
    );
  }
}
