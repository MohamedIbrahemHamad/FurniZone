import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';
import 'package:furnizone/Data/Models/signInModel.dart';
import 'package:furnizone/Data/cache/cache_helper.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.api}) : super(AuthInitial());

  ApiConsumer api;
  LogInModel? logInModel;

  //*login Form key
  GlobalKey<FormState> loginForm = GlobalKey();
  //*login email textField
  TextEditingController logInEmail = TextEditingController();
  //*login password textField
  TextEditingController logInPassword = TextEditingController();

//*register Form key
  GlobalKey<FormState> registerForm = GlobalKey();
//*register FirstName textField
  TextEditingController registerFirstName = TextEditingController();
//*register LastName textField
  TextEditingController registerLastName = TextEditingController();
//*register Phone textField
  TextEditingController registerPhone = TextEditingController();
//*register email textField
  TextEditingController registerEmail = TextEditingController();
//*register password textField
  TextEditingController registerPassword = TextEditingController();
//*register Confirmpassword textField
  TextEditingController registerConfirmPassword = TextEditingController();

//*forget Password Form key
  GlobalKey<FormState> forgotPasswordForm = GlobalKey();
//*forget Password email textField
  TextEditingController forgotPasswordEmail = TextEditingController();

//*verificationForm (OTP) key
  GlobalKey<FormState> verificationForm = GlobalKey();
//*verification (OTP) textField
  TextEditingController verificationPin = TextEditingController();

//*resetPassword Form key
  GlobalKey<FormState> resetPasswordForm = GlobalKey();
//*resetPassword newPassword textField
  TextEditingController newPassword = TextEditingController();
//*resetPassword confirmPassword textField
  TextEditingController confirmNewPassword = TextEditingController();

//? Auth Cubit Functions:

  login() async {
    try {
      emit(LogInLoading());
      final response = await api.post(EndPoint.logIn, data: {
        ApiKey.email: logInEmail.text,
        ApiKey.password: logInPassword.text,
      });
      logInModel = LogInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(logInModel!.token);
      CacheHelper().storeData(key: ApiKey.token, value: logInModel!.token);
      CacheHelper()
          .storeData(key: 'Role', value: decodedToken[ApiKey.authorities][0]);
      bool isAdmin =
          CacheHelper().getData(key: 'Role') == 'ROLE_ADMIN' ? true : false;
      CacheHelper().storeData(key: 'isAdmin', value: isAdmin);

      emit(LogInSuccess());
    } on ApiException catch (e) {
      emit(LogInFailure(errMessage: e.errModel.errorMessage!));
    }
  }

  register() async {
    try {
      emit(RegisterLoading());
      await api.post(EndPoint.register, data: {
        ApiKey.firstName: registerFirstName.text,
        ApiKey.lastName: registerLastName.text,
        ApiKey.email: registerEmail.text,
        ApiKey.password: registerPassword.text,
        ApiKey.confirmPassword: registerConfirmPassword.text,
        ApiKey.phone: registerPhone.text,
      });
      emit(RegisterSuccess());
    } on ApiException catch (e) {
      emit(RegisterFailure(errMessage: e.errModel.errorMessage!));
    }
  }

  forgetPassword() async {
    try {
      emit(ForgetPasswordLoading());
      await api.post(EndPoint.forgetpassword,
          queryParameters: {ApiKey.email: forgotPasswordEmail.text});
      emit(ForgetPasswordSuccess());
    } on ApiException catch (e) {
      emit(ForgetPasswordFailure(errMessage: e.errModel.errorMessage!));
    }
  }

  verifyOTP() async {
    try {
      emit(VerifyOTPLoading());
      final response = await api.post(
        EndPoint.virfyOTP,
        queryParameters: {ApiKey.token: verificationPin.text},
      );
      logInModel = LogInModel.fromJson(response);
      CacheHelper().storeData(key: ApiKey.tempToken, value: logInModel!.token);
      print(CacheHelper().getData(key: ApiKey.tempToken));
      emit(VerifyOTPSuccess());
    } on ApiException catch (e) {
      emit(VerifyOTPFailure(errMessage: e.errModel.errorMessage!));
    }
  }

  resetPassword() async {
    try {
      emit(ResetPasswordLoading());
      await api.put(EndPoint.resetPassword, data: {
        ApiKey.token: CacheHelper().getData(key: ApiKey.tempToken),
        ApiKey.newPassword: newPassword.text,
        ApiKey.confirmPassword: confirmNewPassword.text,
      });
      emit(ResetPasswordSuccess());
    } on ApiException catch (e) {
      emit(ResetPasswordFailure(errMessage: e.errModel.errorMessage!));
    }
  }

//! clear forms
  clearLoginForm() {
    logInEmail.clear();
    logInPassword.clear();
  }

  clearRegisterForm() {
    registerPassword.clear();
    registerFirstName.clear();
    registerLastName.clear();
    registerEmail.clear();
    registerPassword.clear();
    registerConfirmPassword.clear();
    registerPhone.clear();
  }

  clearForgetPasswordForm() {
    forgotPasswordEmail.clear();
  }

  clearVerificationForm() {
    verificationPin.clear();
  }

  clearResetPasswordForm() {
    newPassword.clear();
    confirmNewPassword.clear();
  }
}
