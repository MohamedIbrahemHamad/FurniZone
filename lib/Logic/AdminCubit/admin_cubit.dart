import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';
import 'package:furnizone/Data/Models/addProductModel.dart';
import 'package:furnizone/Helper/uploadImageToAPI.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit({required this.api}) : super(AdminInitial());
  ApiConsumer api;
  Addproductmodel? addproductmodel;
  String? selectedCategory;
  XFile? productImage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockQuantityController = TextEditingController();

  addProduct() async {
    try {
      emit(LoadingAddProduct());
      final response = await api.post(EndPoint.addProduct, data: {
        ApiKey.name: nameController.text,
        ApiKey.category: selectedCategory,
        ApiKey.description: descriptionController.text,
        ApiKey.price: priceController.text,
        ApiKey.stockQuantity: stockQuantityController.text
      });
      //emit(SuccessAddProduct());
      return addproductmodel = Addproductmodel.fromJson(response);
    } on ApiException catch (e) {
      emit(FailedAddProduct(errorMessage: e.errModel.errorMessage!));
    }
  }

  changeCategory({required String newCategory}) {
    selectedCategory = newCategory;
    emit(CategoryChanged());
  }

  clearAllField() {
    productImage = null;
    selectedCategory = null;
    emit(CategoryChanged());
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    stockQuantityController.clear();
  }

  bool formIsValid() {
    return selectedCategory != null &&
        productImage != null &&
        nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        stockQuantityController.text.isNotEmpty;
  }

  uploadProductImage(XFile image) {
    productImage = image;
    emit(UploadProductImage());
  }

  addProductImage(int productId) async {
    try {
      emit(LoadingAddProduct());
      await api.post(EndPoint.uploadProductImageEndPoint(productId),
          data: {ApiKey.file: await uploadImageToAPI(productImage!)},
          isFromData: true);
      emit(SuccessAddProduct());
    } on ApiException catch (e) {
      emit(FailedAddProduct(errorMessage: e.errModel.errorMessage!));
    }
  }
}
