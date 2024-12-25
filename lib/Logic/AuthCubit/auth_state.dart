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

//*  register screen states:
final class RegisterSuccess extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errMessage;
  RegisterFailure({required this.errMessage});
}

//*  ForgetPassword screen states:
final class ForgetPasswordSuccess extends AuthState {}

final class ForgetPasswordLoading extends AuthState {}

final class ForgetPasswordFailure extends AuthState {
  final String errMessage;
  ForgetPasswordFailure({required this.errMessage});
}


//*  OTP Verification screen states:
final class VerifyOTPSuccess extends AuthState {}
final class VerifyOTPLoading extends AuthState {}
final class VerifyOTPFailure extends AuthState {
  final String errMessage;
  VerifyOTPFailure({required this.errMessage});
}

//* reset password screen states:
final class ResetPasswordSuccess extends AuthState {}
final class ResetPasswordLoading extends AuthState {}
final class ResetPasswordFailure extends AuthState {
  final String errMessage;
  ResetPasswordFailure({required this.errMessage});
}