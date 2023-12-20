import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_test/bloc/profile/profile_bloc.dart';
import 'package:m_test/cubit/counter/counter_cubit.dart';
import 'package:m_test/view/splashscreen/splash_screen.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/infomation/information_bloc.dart';
import 'bloc/screeningroundtask/screeningroundtask_bloc.dart';
import 'bloc/todolist/todolist_bloc.dart';
import 'bloc/weather/weather_bloc.dart';
import 'cubit/register/register_cubit.dart';
import 'view/home/home.dart';


void main() {

  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit(),),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit(),),
        BlocProvider<InformationBloc>(create: (context) => InformationBloc(),),
        BlocProvider<ScreeningroundtaskBloc>(create: (context) => ScreeningroundtaskBloc(),),
        BlocProvider<TodolistBloc>(create: (context) => TodolistBloc(),),
        BlocProvider<WeatherBloc>(create: (context) => WeatherBloc(),),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(),),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:   false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: false,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}
