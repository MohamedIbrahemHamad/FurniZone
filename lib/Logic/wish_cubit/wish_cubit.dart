import 'package:bloc/bloc.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';
import 'package:furnizone/Data/Models/all_products_model.dart';
import 'package:meta/meta.dart';

part 'wish_state.dart';

class WishCubit extends Cubit<WishState> {
  WishCubit(this.api) : super(WishInitial());

  final ApiConsumer api;
  late AllProductsModel allProductsModel;
  //late ProductDetailsModel productDetailsModel;
  GetwishList() async {
    try {
      emit(WishIsLoading());
      final response = await api.get(
        EndPoint.showWishList,
      );
      allProductsModel = AllProductsModel.fromJson(response);
      if (allProductsModel.totalElements == 0) {
        emit(NoWishProduct());
      } else {
        emit(GetwishSuccessfully());
      }
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

  DeleteFromWishList({required int id}) async {
    try {
      emit(WishIsLoading());
      final response = await api.delete(EndPoint.DeleteFromWishList(id));
      GetwishList();
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

  AddToCart({required int productId, required int quantity}) async {
    try {
      emit(AddToCartIsLoading());
      final response = await api.post(EndPoint.addToCart, queryParameters: {
        'productId': productId,
        'quantity': quantity,
      });
      GetwishList();
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

}
