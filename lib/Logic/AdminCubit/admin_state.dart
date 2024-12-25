part of 'admin_cubit.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class UploadProductImage extends AdminState {}

final class CategoryChanged extends AdminState {}

final class SuccessAddProduct extends AdminState {}

final class FailedAddProduct extends AdminState {
  final String errorMessage;
  FailedAddProduct({required this.errorMessage});
}

final class LoadingAddProduct extends AdminState {}
