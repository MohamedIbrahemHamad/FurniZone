part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileIsLoading extends ProfileState {}

class GetProfileSuccessfully extends ProfileState {}

class GetProfilefailed extends ProfileState {
  final String errorMessage;
  GetProfilefailed({required this.errorMessage});
}

class ProfileImageIsLoading extends ProfileState {}

class UploadProfileImage extends ProfileState {}
