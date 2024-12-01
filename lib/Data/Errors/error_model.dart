import 'package:furnizone/Data/APIs/End_Ponits.dart';

class ErrorModel {
  final String? errorMessage;

  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData[ApiKey.errorMessage] ??
          jsonData[ApiKey.validationMessage][0],
    );

    //!another way
    // if (jsonData.containsKey(ApiKey.errorMessage)) {
    //   return ErrorModel(errorMessage: jsonData[ApiKey.errorMessage]);
    // } else {
    //   List Mess = jsonData[ApiKey.validationMessage];
    //   return ErrorModel(errorMessage: Mess[0].toString()); }
  }
}
