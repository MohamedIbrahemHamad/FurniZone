part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//* login screen states:
final class LogInSuccess extends AuthState {}

final class LogInLoading extends AuthState {}

final class LogInFailure extends AuthState {
  final String errMessage;
  LogInFailure({required this.errMessage});
}

