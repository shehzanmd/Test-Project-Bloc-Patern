import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_test/bloc/auth/auth_bloc.dart';
import 'package:m_test/bloc/profile/profile_bloc.dart';

class ProfilePage extends StatelessWidget {

   File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true,

        actions: [
          IconButton(onPressed: () => context.read<AuthBloc>().add(LogoutEvent()),
    icon: const Icon(Icons.logout,size: 22,))
        ],

      ),

      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ImageInitial) {}
          else if (state is ImagePickedState) {
            image = state.image;

            print("*****************************************$image");

          } else if (state is ImagePickErrorState) {

          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ImageInitial) {}
            else if (state is ImagePickedState) {
              return profileform(context);
            } else if (state is ImagePickErrorState) {
              return profileform(context);
            }
            return profileform(context);
          },
        ),
      ),


    );
  }

  Widget profileform(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [



          /// -- IMAGE
          Padding(
            padding: const EdgeInsets.only(top: 50,bottom: 10),
            child: Stack(
              children: [
                SizedBox(
                  width: 130,
                  height: 130,
                  child: image != null? ClipRRect(
                      borderRadius: BorderRadius.circular(100), child: Image.file(image!,fit: BoxFit.cover,)) : ClipRRect(
                      borderRadius: BorderRadius.circular(100), child: const Icon(Icons.account_circle_rounded,size: 140,color: Colors.grey,)),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: (){
                      // Trigger the image picking event
                      context.read<ProfileBloc>().add(PickImageEvent());
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black87),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

         const Padding(
           padding: EdgeInsets.only(bottom: 5),
           child: Text("User"),
         ),

          const Text("user@gmail.com")






        ],
      ),
    );
  }


}




