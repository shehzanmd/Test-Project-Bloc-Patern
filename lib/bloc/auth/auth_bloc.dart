import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async{

      if (event is LoginEvent) {
        // Simulate an asynchronous login process
        await Future.delayed(Duration(seconds: 1));

        // Check login credentials (in a real app, you would validate against a backend)
        if (event.username == "user" && event.password == "password") {

          emit(AuthLoggedInState());
        }
      } else if (event is LogoutEvent) {
        emit(AuthLoggedOutState());
      }

    });
  }
}


