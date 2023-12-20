import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';

class LoginScreen extends StatelessWidget {

    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: loginform(context),
    );
  }

  Widget loginform(BuildContext context){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: Container(
                width: 200,
                height: 150,
                /*decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0)),*/
                child: Image.asset('asset/images/flutter-logo1.png')),
          ),
        ),
        Padding(
          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter your name'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
          //padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: passwordController,

            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter secure password'),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: InkWell(
            onTap: () {

            },
            child:  const Text(
              'Forgot Password',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ),



        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child:  ElevatedButton(
            onPressed: () {
              // Trigger the login event
              context.read<AuthBloc>().add(LoginEvent(username: nameController.text, password: passwordController.text));

              print("###################################${nameController.text}");
              print("###################################${passwordController.text}");

            },
            child: const Text('Log In'),
          ),
        ),

        const Expanded(child: SizedBox()),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('New User? '),
            Text('Create Account',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue),),
          ],
        ),

        const SizedBox(height: 40,)
      ],
    );
  }

}
