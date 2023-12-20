import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/screeningroundtask/screeningroundtask_bloc.dart';


class ScreenRoundTaskPage extends StatefulWidget {
  const ScreenRoundTaskPage({Key? key,}) : super(key: key);


  @override
  _ScreenRoundTaskPageState createState() => _ScreenRoundTaskPageState();
}

class _ScreenRoundTaskPageState extends State<ScreenRoundTaskPage> {

  var randomNumber=0;
  var success_msg= "Try again";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Round Task Page'),
      ),
      body: Center(
          child: BlocListener<ScreeningroundtaskBloc, ScreeningroundtaskState>(
            listener: (context, state) {
              if (state is RandomInitial) {}
              else if (state is RandomGenerated) {
                randomNumber = state.randomNumber;
              }
              else if (state is SuccessState) {
                success_msg = state.successmsg;
              }
              else if(state is TryAgainState){
                success_msg = state.trymsg;
              }
            },
            child: BlocBuilder<ScreeningroundtaskBloc, ScreeningroundtaskState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Widget 1
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                      child: Container(
                        height: 200,
                        color: Colors.black,
                        child: Center(
                          child: Text('$success_msg',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                      child: Row(
                        children: [


                          /// Widget 2
                          ElevatedButton(
                            onPressed: (){
                              BlocProvider.of<ScreeningroundtaskBloc>(context).add(
                                  TapWidget2Event());
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              child: const Center(
                                child: Text('Tap me',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo, // Set the background color here
                            ),
                          ),

                          SizedBox(width: 8,),

                          /// Widget 3
                          Expanded(
                            child: Container(
                              height: 150,
                              color: Colors.deepOrange,
                              child: Center(
                                child: Text('$randomNumber',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),




                  ],
                );
              },
            ),
          )
      ),
    );
  }
}


