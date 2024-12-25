import 'package:bloc/bloc.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';
import 'package:furnizone/Data/Models/all_products_model.dart';
import 'package:furnizone/Data/Models/product_details_model.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.api) : super(DetailsInitial());
  final ApiConsumer api;
  late AllProductsModel allProductsModel;
  late ProductDetailsModel productDetailsModel;

  GetProductDetails({required int id}) async {
    try {
      emit(ProductDetailsIsLoading());
      final response = await api.get(EndPoint.GetProductDetails(id));
      productDetailsModel = ProductDetailsModel.fromJson(response);
      emit(GetProductDetailsSuccessfully());
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

  AddToWishList({required int id}) async {
    try {
      emit(AddToWishIsLoading());
      final response = await api.post(EndPoint.AddToWishList(id));
      GetProductDetails(id: id);
    } on ApiException catch (e) {
      print(e.toString());
    }
  }

  DeleteFromWishList({required int id, required String screen}) async {
    try {
      emit(DeleteFromListIsLoading());
      final response = await api.delete(EndPoint.DeleteFromWishList(id));
      GetProductDetails(id: id);
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
      GetProductDetails(id: productId);
    } on ApiException catch (e) {
      print(e.toString());
    }
  }
}
