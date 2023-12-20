part of 'register_cubit.dart';

class RegisterState {
  int currentpage;
  final PageController pageController;

  RegisterState(this.currentpage, this.pageController);
}

class RegisterInitial extends RegisterState {
  RegisterInitial(super.currentpage, super.pageController);
}

class RegisterLoading extends RegisterState {
  RegisterLoading(
    super.currentpage,
    super.pageController,
  );
}

class Usernameregistered extends RegisterState {
  final String username;
  Usernameregistered(super.currentpage, super.pageController, this.username);
}

class Usernameregisteredfailed extends RegisterState {
  final String error;

  Usernameregisteredfailed(super.currentpage, super.pageController, this.error);
}

class Emailregistered extends RegisterState {
  final String email;

  Emailregistered(super.currentpage, super.pageController, this.email);
}

class Emailregisteredfailed extends RegisterState {
  final String error;

  Emailregisteredfailed(super.currentpage, super.pageController, this.error);
}

class RegisterSuccess extends RegisterState {
  final String username;
  final String email;

  RegisterSuccess(
      super.currentpage, super.pageController, this.username, this.email);
}

class Registerfailed extends RegisterState {
  final String error;
  Registerfailed(super.currentpage, super.pageController, this.error);
}
