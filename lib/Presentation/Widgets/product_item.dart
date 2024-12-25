import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Data/Models/all_products_model.dart';
import 'package:furnizone/Logic/home_cubit/home_cubit.dart';
import 'package:furnizone/Logic/wish_cubit/wish_cubit.dart';
import 'package:furnizone/Presentation/Pages/HomePages/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final String screen;

  ProductItem({
    required this.index,
    required this.screen,
  });

  late AllProductsModel allProductsModel;

  @override
  Widget build(BuildContext context) {
    if (screen == 'Home') {
      allProductsModel = BlocProvider.of<HomeCubit>(context).allProductsModel;
    } else {
      allProductsModel = BlocProvider.of<WishCubit>(context).allProductsModel;
    }
    final List<Content> allProduct = allProductsModel.content!;
    Content product = allProduct[index];
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailsScreen.id,
                arguments: product.id!);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey[100],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.memory(
                      product.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff4A628A),
                            ),
                          ),
                          Text(
                            '\$${product.price!}',
                            style: TextStyle(
                              color: const Color(0xff4A628A),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: () {
                            if (screen == 'Home') {
                              BlocProvider.of<HomeCubit>(context).AddToCart(
                                productId: product.id!,
                                quantity: 1,
                              );
                            } else {
                              BlocProvider.of<WishCubit>(context).AddToCart(
                                productId: product.id!,
                                quantity: 1,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff4A628A),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                if (screen == 'Home') {
                  !product.favorite!
                      ? BlocProvider.of<HomeCubit>(context).AddToWishList(
                          id: product.id!,
                        )
                      : BlocProvider.of<HomeCubit>(context).DeleteFromWishList(
                          id: product.id!,
                        );
                } else {
                  if (product.favorite!) {
                    BlocProvider.of<WishCubit>(context).DeleteFromWishList(
                      id: product.id!,
                    );
                  }
                }
              },
              child: Icon(
                product.favorite! ? Icons.favorite : Icons.favorite_border,
                color:
                    product.favorite! ? Color(0xff4A628A) : Color(0xff4A628A),
                size: 30,
              ),
            )),
      ],
    );
  }
}
