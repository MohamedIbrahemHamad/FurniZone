import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Data/Models/all_products_model.dart';
import 'package:furnizone/Logic/wish_cubit/wish_cubit.dart';
import 'package:furnizone/Presentation/Widgets/product_item.dart';


class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WishCubit>(context).GetwishList();
    return BlocConsumer<WishCubit, WishState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is WishIsLoading) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is NoWishProduct) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: Text('No Wish Product')),
          );
        }

        if (state is GetwishSuccessfully || state is AddToCartIsLoading) {
          AllProductsModel allProductsModel =
              BlocProvider.of<WishCubit>(context).allProductsModel;
          final List<Content> allProduct = allProductsModel.content!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'Wishlist',
                style: TextStyle(
                  color: Color(0xFF304E3E),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  itemCount: allProduct.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      screen: 'wish',
                      index: index,
                    );
                  },
                )),
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
