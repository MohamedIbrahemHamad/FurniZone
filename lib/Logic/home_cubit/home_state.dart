part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductIsLoading extends HomeState {}

final class NoProductInHome extends HomeState {}

final class GetProductSuccessfully extends HomeState {}

final class AddToWishListIsLoading extends HomeState {}

final class DeleteFromWishListsLoading extends HomeState {}

final class AddToCartIsLoading extends HomeState {}

final class FilterSuccessfully extends HomeState {}

final class NoProductInFilter extends HomeState {}


final class NoProductInCategorize extends HomeState {}

final class CategorizeSuccessfully extends HomeState {}

//////////////////////


// final class DeleteFromListIsLoading extends HomeState {}

// final class ProductDetailsIsLoading extends HomeState {}

// final class GetProductDetailsSuccessfully extends HomeState {}

// final class AddToCartSuccessfully extends HomeState {}
