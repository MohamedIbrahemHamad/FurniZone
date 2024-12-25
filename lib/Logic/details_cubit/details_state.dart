part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class ProductDetailsIsLoading extends DetailsState {}

final class AddToWishIsLoading extends DetailsState {}

final class DeleteFromListIsLoading extends DetailsState {}

final class GetProductDetailsSuccessfully extends DetailsState {}

final class AddToCartIsLoading extends DetailsState {}

final class AddToCartSuccessfully extends DetailsState {}
