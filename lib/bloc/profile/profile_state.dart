part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ImageInitial extends ProfileState {}

class ImagePickedState extends ProfileState {
  final File image;

  ImagePickedState({required this.image});
}

class ImagePickErrorState extends ProfileState {}