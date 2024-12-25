import 'package:flutter/material.dart';
import 'package:furnizone/Presentation/Pages/HomePages/cart_screen.dart';
import 'package:furnizone/Presentation/Pages/HomePages/completed_order.dart';
import 'package:furnizone/Presentation/Widgets/ElevatedButtonStyle.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';

class SubtotalComponent extends StatelessWidget {
  const SubtotalComponent({super.key, required this.arguments});
  final Arguments arguments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 187, 186, 186),
                  offset: Offset(5, -5),
                  spreadRadius: 2,
                  blurRadius: 10),
            ],
          ),
          height: 330,
          width: 370,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextStyleWidget(
                            text: 'Total',
                            color: Color(0xFF4A628A),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'popins',
                          ),
                          Spacer(),
                          TextStyleWidget(
                            text: '${arguments.totalPrice}',
                            color: Color(0xFF4A628A),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'popins',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextStyleWidget(
                            text: 'Shipping Fee',
                            color: Color(0xFF4A628A),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'popins',
                          ),
                          Spacer(),
                          TextStyleWidget(
                            text: '0.0',
                            color: Color(0xFF4A628A),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'popins',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextStyleWidget(
                            text: 'Total (${arguments.totalItem} Items)',
                            color: Color(0xFF828282),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'popins',
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 1,
                        color: Color(0xFF4A628A),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextStyleWidget(
                            text: 'Subtotal',
                            color: Color(0xFF4A628A),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'popins',
                          ),
                          Spacer(),
                          TextStyleWidget(
                            text: '${arguments.totalPrice}',
                            color: Color(0xFF4A628A),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'popins',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButtonStyle(
                  title: 'Confirm Order',
                  fontSize: 16,
                  widthElevatedButton: 270,
                  heightElevatedButton: 47,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, CompletedOrder.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
