import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Data/Models/all_products_model.dart';
import 'package:furnizone/Logic/home_cubit/home_cubit.dart';
import 'package:furnizone/Logic/nav/category_cubit.dart';
import 'package:furnizone/Presentation/Widgets/category_icon_item.dart';
import 'package:furnizone/Presentation/Widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  final List<String> categoryName = [
    'Home',
    'Sofa',
    'Chair',
    'Lamp',
    'Table',
    'Bed',
  ];

  final List<IconData> categoryIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.couch,
    Icons.chair_rounded,
    Icons.light_sharp,
    Icons.table_bar,
    FontAwesomeIcons.bed,
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).GetAllItems();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProductIsLoading ||
            state is AddToWishListIsLoading ||
            state is DeleteFromWishListsLoading ||
            state is AddToCartIsLoading) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is NoProductInHome) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: Text('No Product')),
          );
        }

        if (state is NoProductInFilter) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: Text('There Is No Product Having that name')),
          );
        }

        if (state is NoProductInCategorize) {
          return Scaffold(
            backgroundColor: Color(0xFFE3E3E3),
            body: Center(child: Text('There Is No Product In This Category')),
          );
        }

        if (state is GetProductSuccessfully ||
            state is FilterSuccessfully ||
            state is CategorizeSuccessfully) {
          AllProductsModel allProductsModel =
              BlocProvider.of<HomeCubit>(context).allProductsModel;
          final List<Content> allProduct = allProductsModel.content!;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Color(0xFF304E3E),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextField(
                    controller:
                        BlocProvider.of<HomeCubit>(context).searchTextFilde,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () {
                          BlocProvider.of<HomeCubit>(context)
                              .GetFilterProducts();
                        },
                        child: Icon(
                          Icons.search,
                          color: Color(0xff4A628A),
                        ),
                      ),
                      hintText: 'Search for Furniture',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      // suffixIcon: Icon(Icons.filter_list, color: Color(0xff4A628A)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    child: BlocBuilder<CategoryCubit, int>(
                      builder: (context, selectedCategoryIndex) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryIcons.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<CategoryCubit>()
                                    .selectCategory(index);
                                BlocProvider.of<HomeCubit>(context)
                                    .GetCategorizeProducts(
                                        cat: categoryName[index]);
                              },
                              child: CategoryIconItem(
                                icon: categoryIcons[index],
                                isSelected: index == selectedCategoryIndex,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: BlocBuilder<CategoryCubit, int>(
                      builder: (context, selectedCategoryIndex) {
                        return GridView.builder(
                          itemCount: allProduct.length,
                          clipBehavior: Clip.none,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(
                              screen: 'Home',
                              index: index,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
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
