import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_test/view/profile/profilescreen.dart';
import 'package:m_test/view/waetherPage/weatherPage.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../clocktimer/clock_timer_screen.dart';
import '../counterPage/counter_page.dart';
import '../increment/increment_page.dart';
import '../information/information_page.dart';
import '../registration/registration_page.dart';
import '../screeningroundTask/screening_round_task_page.dart';
import '../todoList/todo_list_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Daily Tasks"),
        centerTitle: true,
        actions: [

          IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));

          }, icon: Icon(Icons.account_circle_rounded,size: 20,color: Colors.white,))

          ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CounterPage()));
                },
                child: const Text('Counter Using Bloc cubit'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IncrementPage(),
                    ),
                  );
                },
                child: const Text('Increment'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage(),
                    ),
                  );
                },
                child: const Text('Registration Using Bloc cubit'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Information(),
                    ),
                  );
                },
                child: const Text('Api calling Using Bloc'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenRoundTaskPage(),
                    ),
                  );
                },
                child: const Text('Screen Round Task Using Bloc'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoListPage(),
                    ),
                  );
                },
                child: const Text('Todo List Using Bloc'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeathePage(),
                    ),
                  );
                },
                child: const Text('Weather Using Bloc'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClockTimerPage(),
                    ),
                  );
                },
                child: const Text('Clock Timer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
