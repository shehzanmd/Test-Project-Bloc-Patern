import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../auth/loginscreen.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), (){
      context.read<AuthBloc>().add(LogoutEvent());
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoggedInState) {
          return const Home();
        } else if (state is AuthLoggedOutState) {
          return LoginScreen();
        } else {
          return splashscreen(); // Placeholder for other states
        }
      },
    );
  }

  Widget splashscreen(){
    return Scaffold(
      body: Center(
        child: Container(
          child: const Icon(Icons.spa,size: 90,color: Colors.deepPurple,),
        ),
      )
    );
  }
}


