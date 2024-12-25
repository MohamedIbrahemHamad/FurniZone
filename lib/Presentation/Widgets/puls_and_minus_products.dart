import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Data/Models/cart_model.dart';
import 'package:furnizone/Logic/cart_cubit/cart_cubit.dart';
import 'icon_button_style.dart';

class PulsAndMinusProducts extends StatelessWidget {
  PulsAndMinusProducts({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    CartModel cartModel = BlocProvider.of<CartCubit>(context).cartModel;
    final List<Content> content = cartModel.content!;

    return Container(
      width: 70,
      height: 30,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFCDCBCB),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButtonStyle(
            iconColor: Color(0xFF304E3E),
            iconShape: FontAwesomeIcons.plus,
            iconSize: 10,
            buttonWidth: 20,
            buttonHeight: 20,
            onPressed: () {
              BlocProvider.of<CartCubit>(context).UpdateProductQuantity(
                  itemId: content[index].itemId!,
                  change: 'Plus',
                  quantity: content[index].quantity!);
            },
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            '${content[index].quantity!}',
            style: TextStyle(color: Color(0xFF4A628A)),
          ),
          SizedBox(
            width: 4,
          ),
          IconButtonStyle(
            iconColor: Color(0xFF304E3E),
            iconShape: FontAwesomeIcons.minus,
            iconSize: 10,
            buttonWidth: 20,
            buttonHeight: 20,
            onPressed: () {
              BlocProvider.of<CartCubit>(context).UpdateProductQuantity(
                  itemId: content[index].itemId!,
                  change: 'Minus',
                  quantity: content[index].quantity!);
            },
          ),
        ],
      ),
    );
  }
}
