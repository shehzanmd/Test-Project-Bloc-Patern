import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_test/cubit/register/register_cubit.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  String? username;

  String? email;

  String? _Usernameerromsg;

  String? _Emailerromsg;

  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        centerTitle: true,
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Usernameregistered) {
            username = state.username;
          }
          if (state is Emailregistered) {
            email = state.email;
          }
          if (state is Usernameregisteredfailed) {
            _Usernameerromsg = state.error;
          }
          if (state is Emailregisteredfailed) {
            _Emailerromsg = state.error;
          }
        },
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: state.pageController,
                       physics: const NeverScrollableScrollPhysics(),
                      pageSnapping: false,
                      // onPageChanged: (index) {
                      //   context.read<RegisterCubit>().setPage(index);
                      // },
                      children: [
                        UsernamePage(_Usernameerromsg),
                        EmailPage(_Emailerromsg),
                        SubmitPage(username, email, _error),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (state.currentpage > 0)
                        IconButton(
                          onPressed: () {
                            context
                                .read<RegisterCubit>()
                                .jumpToPagePrevious(state.currentpage);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      const Spacer(),
                      if (state.currentpage < 2)
                        IconButton(
                          onPressed: () {
                            print("*************  $email ***************");

                            context.read<RegisterCubit>().jumpToPageNext(
                                state.currentpage,
                                username.toString(),
                                email.toString());
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                        )
                    ],
                  )
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}

// username_page.dart

class UsernamePage extends StatelessWidget {
  final String? _errormsg;
  UsernamePage(this._errormsg);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.yellow,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (username) {
                  context.read<RegisterCubit>().setusername(username);
                },
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              _errormsg != null ? Text("$_errormsg") : Container(),
            ],
          ),
        );
      },
    );
  }
}

// email_page.dart

class EmailPage extends StatelessWidget {
  final String? _errormsg;
  EmailPage(this._errormsg);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.pinkAccent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (email) {
                  context.read<RegisterCubit>().setemail(email);
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              _errormsg != null ? Text("$_errormsg") : Container(),
            ],
          ),
        );
      },
    );
  }
}

// submit_page.dart
class SubmitPage extends StatelessWidget {
  String? username;
  String? email;
  final String? _errormsg;

  SubmitPage(this.username, this.email, this._errormsg);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.tealAccent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Username: $username'),
                Text('Email: $email'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<RegisterCubit>()
                        .finish(username.toString(), email.toString());
                  },
                  child: const Text('Submit'),
                ),
                _errormsg != null ? Text("$_errormsg") : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
