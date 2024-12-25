import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Data/Models/product_details_model.dart';
import 'package:furnizone/Logic/details_cubit/details_cubit.dart';
import 'package:furnizone/Presentation/Widgets/TextStyleWidget.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String id = 'productDetails';

  const ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    BlocProvider.of<DetailsCubit>(context).GetProductDetails(id: index);

    return BlocConsumer<DetailsCubit, DetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetProductDetailsSuccessfully) {
          ProductDetailsModel productDetailsModel =
              BlocProvider.of<DetailsCubit>(context).productDetailsModel;
          return Scaffold(
            backgroundColor: Color(0xffDFDBDB),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              title: TextStyleWidget(
                text: 'Product Details',
                color: Color(0xFF304E3E),
                fontSize: 24,
                fontWeight: FontWeight.bold, fontFamily: 'popins',
              ),
            ),
            body: Column(children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Image.memory(
                  productDetailsModel.image!,
                  height: 284,
                  width: 205,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 385,
                width: 390,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24, right: 24, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productDetailsModel.name!,
                            style: TextStyle(
                              color: Color(0xff4A628A),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            productDetailsModel.description!,
                            style: TextStyle(
                              fontSize: 18,
                              //height: 1.5,
                              color: Color(0xff828282),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            r'$' '${productDetailsModel.price!}',
                            style: TextStyle(
                              fontSize: 32,
                              //height: 1.5,
                              color: Color(0xff4A628A),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, top: 24),
                      child: Row(
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                              color: Color(0xff828282),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                              color: Color(0xff828282),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xff4A628A),
                                  width: 1,
                                )),
                            child: IconButton(
                              onPressed: () {
                                !productDetailsModel.favorite!
                                    ? BlocProvider.of<DetailsCubit>(context)
                                        .AddToWishList(
                                            id: productDetailsModel.id!)
                                    : BlocProvider.of<DetailsCubit>(context)
                                        .DeleteFromWishList(
                                            id: productDetailsModel.id!,
                                            screen: "details");
                              },
                              icon: Icon(
                                productDetailsModel.favorite!
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: productDetailsModel.favorite!
                                    ? Color(0xff4A628A)
                                    : Color(0xff4A628A),
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xff4A628A),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<DetailsCubit>(context)
                                    .AddToCart(
                                  productId: productDetailsModel.id!,
                                  quantity: 1,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff4A628A),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              child: const Center(
                                child: Text(
                                  " Add To Cart ",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ]),
          );
        } else {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
