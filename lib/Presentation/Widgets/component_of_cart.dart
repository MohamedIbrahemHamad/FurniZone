import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Data/Models/cart_model.dart';
import 'package:furnizone/Logic/cart_cubit/cart_cubit.dart';
import 'icon_button_style.dart';
import 'photo_and_info.dart';
import 'puls_and_minus_products.dart';

class ComponentOfCart extends StatelessWidget {
  ComponentOfCart({
    super.key,
    required this.image,
    required this.title,
    required this.moreDetiles,
    required this.price,
    required this.quantity,
    required this.index,
  });

  final Uint8List image;
  final String title;
  final String moreDetiles;
  final double price;
  final int quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    CartModel cartModel = BlocProvider.of<CartCubit>(context).cartModel;
    final List<Content> content = cartModel.content!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
        width: 365,
        height: 107,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButtonStyle(
                iconColor: Color(0xFF304E3E),
                iconShape: FontAwesomeIcons.trashCan,
                iconSize: 25,
                buttonWidth: 40,
                buttonHeight: 40,
                onPressed: () {
                  BlocProvider.of<CartCubit>(context).DeleteItem(
                    itemId: content[index].itemId!,
                  );
                },
              ),
              PhotoAndInfo(
                image: image,
                title: title,
                moreDetiles: moreDetiles,
                price: price,
              ),
              Spacer(),
              PulsAndMinusProducts(
                index: index,
              )
            ],
          ),
        ),
      ),
    );
  }
}
