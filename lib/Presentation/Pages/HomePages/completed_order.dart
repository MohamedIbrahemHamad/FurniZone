import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Logic/cart_cubit/cart_cubit.dart';
import 'package:furnizone/Logic/nav/navigation_cubit.dart';
import 'package:furnizone/Presentation/Pages/HomePages/main_screen.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';


class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});
  static String id = 'Done';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
            width: 800,
          ),
          Container(
            alignment: Alignment.center,
            width: 260,
            height: 260,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/photos/Trusted Seller E Commerce 3D Illustrations.jpg'),
                  fit: BoxFit.cover),
            ),
            // child: Image.asset('assets/background.jpg'),
          ),
          const SizedBox(
            height: 150,
          ),
          TextStyleWidget(
              text: 'Your order has been',
              color: Color(0xFF4A628A),
              fontSize: 24,
              fontWeight: FontWeight.bold, fontFamily: 'popins',),
          TextStyleWidget(
              text: 'placed successfully',
              color: Color(0xFF4A628A),
              fontSize: 24,
              fontWeight: FontWeight.bold, fontFamily: 'popins',),
          const SizedBox(
            height: 30,
          ),
          TextStyleWidget(
              text: 'Thank you for choosing us! Feel free to continue',
              color: Color(0xFF6F7384),
              fontSize: 14,
              fontWeight: FontWeight.normal, fontFamily: 'popins',),
          TextStyleWidget(
              text: 'shopping and explore our wide range of',
              color: Color(0xFF6F7384),
              fontSize: 14,
              fontWeight: FontWeight.normal, fontFamily: 'popins',),
          TextStyleWidget(
              text: 'products. Happy Shopping!',
              color: Color(0xFF6F7384),
              fontSize: 14,
              fontWeight: FontWeight.normal, fontFamily: 'popins',),
          const SizedBox(
            height: 80,
          ),
          ElevatedButtonStyle(
            title: 'Continue Shopping',
            fontSize: 20,
            widthElevatedButton: 298,
            heightElevatedButton: 51,
            onPressed: () {
              BlocProvider.of<CartCubit>(context).DeleteAll();
              BlocProvider.of<NavigationCubit>(context).navigateTo(0);
              Navigator.of(context).pushNamedAndRemoveUntil(
                MainScreen.id,
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
