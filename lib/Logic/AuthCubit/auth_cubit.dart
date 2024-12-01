import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.api}) : super(AuthInitial());
  ApiConsumer api;

  //*login Form key
  GlobalKey<FormState> loginForm = GlobalKey();
  //*login email textField
  TextEditingController logInEmail = TextEditingController();
  //*login password textField
  TextEditingController logInPassword = TextEditingController();

//? Cubit Functions:
  login() async {
    try {
      emit(LogInLoading());
      final response = await api.post(EndPoint.logIn, data: {
        ApiKey.email: logInEmail.text,
        ApiKey.password: logInPassword.text,
      });
      emit(LogInSuccess());
    } on ApiException catch (e) {
      emit(LogInFailure(errMessage: e.errModel.errorMessage!));
    }
  }
}
