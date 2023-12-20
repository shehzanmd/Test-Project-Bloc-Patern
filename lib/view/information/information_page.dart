import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/infomation/information_bloc.dart';

class Information extends StatelessWidget {

  final Random random = Random();


  @override
  Widget build(BuildContext context) {

    // Trigger API call when the page loads
    context.read<InformationBloc>().add(FetchInformationAPI());

    // Schedule random API calls every 5 minutes
    Timer.periodic(Duration(seconds: 5), (timer) {
      context.read<InformationBloc>().add(FetchInformationAPI());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("API Data Information"),
        centerTitle: true,
      ),
      body: BlocBuilder<InformationBloc, InformationState>(
        builder: (context, state) {
         if(state.isFetched){
           return const Center(child: CircularProgressIndicator(color: Colors.purple,));
         }
         return Center(
           child: Text(style: TextStyle(fontSize: 18), "${state.infomation?.activity ?? "No Data"}",),
         );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
        // context.read<InformationBloc>().add(FetchInformationAPI());
        },
        child: const Text('Fetch API'),
      ),
    );
  }
}
