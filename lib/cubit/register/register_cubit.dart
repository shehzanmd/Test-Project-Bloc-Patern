import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial(0,PageController(),));

  // void setPage(int pageIndex) {
  //   emit(RegisterState(pageIndex,PageController(),));
  // }

  void jumpToPageNext(int pageIndex,String username,String email) {

    if(pageIndex==0){

      if(username.isEmpty || username == "null"){

        print("#####################  1 #####################");

        emit(Usernameregisteredfailed(pageIndex, state.pageController, "Username is empty"));

      }else{

        print("###################### 2  ####################");

        state.pageController.jumpToPage(pageIndex + 1);
        emit(RegisterState(pageIndex + 1, state.pageController));

      }


    }else if(pageIndex==1){


      if(email.isEmpty || email == "null"){

        print("###################### 3  ####################");

        emit(Emailregisteredfailed(pageIndex, state.pageController, "email is empty"));

      }else{

        print("###################### 4  ####################");

        state.pageController.jumpToPage(pageIndex + 1);
        emit(RegisterState(pageIndex + 1, state.pageController));

      }

    } else{

      print("###################### 5  ####################");

        state.pageController.jumpToPage(pageIndex + 1);
        emit(RegisterState(pageIndex + 1, state.pageController));
    }
  }

  void jumpToPagePrevious(int pageIndex) {
    if (pageIndex > 0) {
      state.pageController.jumpToPage(pageIndex - 1);
      emit(RegisterState(pageIndex - 1, state.pageController));
    }
  }

  void setusername(String username){
      print("***********************  $username *********************************");
      emit(Usernameregistered(state.currentpage,state.pageController,username));
  }

  void setemail(String email){
      print("***********************  $email *********************************");
      emit(Emailregistered(state.currentpage,state.pageController,email));
  }

  void finish(String username,String email){
    if(username=="null" || email == "null"){

      emit(Registerfailed(state.currentpage,state.pageController,"Error"));
    }
    else{
      print("***********************  $username  $email *********************************");

      Fluttertoast.showToast(
          msg: "Registration Successfully!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );

      emit(RegisterSuccess(state.currentpage,state.pageController,username.toString(),email.toString()));
    }
  }


}

