import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_test/cubit/counter/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});


  Widget build(BuildContext context) {
    print("************** Build  ******************");
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        print("************** BlocBuilder  ******************");
        return Scaffold(
          appBar: AppBar(title: const Text("Counter Page"), centerTitle: true,),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("${state.counterValue}"),

              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "decrement",
                onPressed: () => context.read<CounterCubit>().decrement(),
                child: const Icon(Icons.remove),),
              const SizedBox(width: 10,),
              FloatingActionButton(
                heroTag: "increment",
                onPressed: () => context.read<CounterCubit>().increment(),
                child: const Icon(Icons.add),),
            ],
          ),
        );
      },
    );
  }

}