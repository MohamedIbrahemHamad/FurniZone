import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';
import 'package:furnizone/Data/Models/all_products_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());

  final ApiConsumer api;
  late AllProductsModel allProductsModel;
  TextEditingController searchTextFilde = TextEditingController();

  GetAllItems() async {
    try {
      emit(ProductIsLoading());
      final response = await api.get(
        EndPoint.allProducts,
      );
      allProductsModel = AllProductsModel.fromJson(response);
      if (allProductsModel.totalElements == 0) {
        emit(NoProductInHome());
      } else {
        emit(GetProductSuccessfully());
      }
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

  AddToWishList({required int id}) async {
    try {
      emit(AddToWishListIsLoading());
      final response = await api.post(EndPoint.AddToWishList(id));
      GetAllItems();
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

  DeleteFromWishList({required int id}) async {
    try {
      emit(DeleteFromWishListsLoading());
      final response = await api.delete(EndPoint.DeleteFromWishList(id));
      GetAllItems();
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

  GetFilterProducts() async {
    try {
      emit(ProductIsLoading());
      final response = await api.get(EndPoint.filterProducts, queryParameters: {
        "keyword": searchTextFilde.text,
      });
      allProductsModel = AllProductsModel.fromJson(response);
      if (allProductsModel.totalElements == 0) {
        emit(NoProductInFilter());
        searchTextFilde.clear();
      } else {
        emit(FilterSuccessfully());
        searchTextFilde.clear();
      }
    } on ApiException catch (e) {
      emit(NoProductInFilter());
      searchTextFilde.clear();
    }
  }

  GetCategorizeProducts({required String cat}) async {
    if (cat == 'Home') {
      GetAllItems();
    } else {
      try {
        emit(ProductIsLoading());
        final response =
            await api.get(EndPoint.CategorizeProducts, queryParameters: {
          "category": cat,
        });
        allProductsModel = AllProductsModel.fromJson(response);
        if (allProductsModel.totalElements == 0) {
          emit(NoProductInCategorize());
        } else {
          emit(CategorizeSuccessfully());
        }
      } on ApiException catch (e) {
        emit(NoProductInCategorize());
      }
    }
  }

  AddToCart({required int productId, required int quantity}) async {
    try {
      emit(AddToCartIsLoading());
      final response = await api.post(EndPoint.addToCart, queryParameters: {
        'productId': productId,
        'quantity': quantity,
      });
      GetAllItems();
    } on ApiException catch (e) {
      print(e.toString());
    }
  }
}
