import 'package:furnizone/Data/APIs/End_Ponits.dart';

class LogInModel {
//! this model will store the rseponse of sign in request & OTV verification request

  final String token;

  LogInModel({required this.token}); 
  
factory LogInModel.fromJson(Map<String,dynamic> jsonData){
  return LogInModel( token:jsonData[ApiKey.token]); 
}

}
