import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ImageInitial()) {
    on<ProfileEvent>((event, emit) async{

      if (event is PickImageEvent) {
        final pickedImage = await _pickImage();
        if (pickedImage != null) {
          emit(ImagePickedState(image: pickedImage));
        } else {
          emit(ImagePickErrorState());
        }
      }

    });
  }

  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      return pickedFile != null ? File(pickedFile.path) : null;
    } catch (e) {
      print("Error picking image: $e");
      return null;
    }
  }

}
