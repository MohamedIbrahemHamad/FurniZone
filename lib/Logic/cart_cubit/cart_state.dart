part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

//final class CounterInitialState extends CartState {}

class CounterChangeState extends CartState {}

class CartIsLoading extends CartState {}

class GetCartItemSuccessfully extends CartState {}

class NoCartItem extends CartState {}

class GetCartItemsfailed extends CartState {
  final String errorMessage;
  GetCartItemsfailed({required this.errorMessage});
}

class UpdateQuantity extends CartState {}

class UpdateQuantityIsLoading extends CartState {}

class DeleteAllSuccessfully extends CartState {}
