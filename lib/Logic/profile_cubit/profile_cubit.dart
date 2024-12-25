import 'dart:convert';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:furnizone/Data/APIs/Api_Consumer.dart';
import 'package:furnizone/Data/APIs/End_Ponits.dart';
import 'package:furnizone/Data/Errors/exceptions.dart';
import 'package:furnizone/Data/Models/profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(ProfileInitial());

  final ApiConsumer api;
  late ProfileModel profileModel;

  GetProfileInfo() async {
    try {
      emit(ProfileIsLoading());
      final response = await api.get(EndPoint.userprofile);
      profileModel = ProfileModel.fromJson(response);
      emit(GetProfileSuccessfully());
    } on ApiException catch (e) {
      emit(GetProfilefailed(errorMessage: e.errModel.errorMessage!));
      print(e.toString());
    }
  }

  UploadProfilePic(XFile image) async {
    try {
      Uint8List imageBytes = await image.readAsBytes();
      
      profileModel.profilePicture = imageBytes;
      final response = await api.post(
        EndPoint.uploadprofilepicture,
        isFromData: true,
        data: {
          ApiKey.file: await uploadImageToAPI(image),
        },
      );
      emit(UploadProfileImage());
    } catch (e) {
      print(e);
    }
  }
}

Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
