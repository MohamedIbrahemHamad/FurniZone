part of 'wish_cubit.dart';

@immutable
sealed class WishState {}

final class WishInitial extends WishState {}

final class NoWishProduct extends WishState {}

final class GetwishSuccessfully extends WishState {}

final class WishIsLoading extends WishState {}

final class AddToCartIsLoading extends WishState {}
