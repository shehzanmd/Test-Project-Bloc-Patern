part of 'screeningroundtask_bloc.dart';

@immutable
abstract class ScreeningroundtaskState {}

class RandomInitial extends ScreeningroundtaskState {}

class RandomGenerated extends ScreeningroundtaskState {
  final int randomNumber;

  RandomGenerated(this.randomNumber);
}

class SuccessState extends ScreeningroundtaskState {
  final String successmsg;

  SuccessState(this.successmsg);
}

class TryAgainState extends ScreeningroundtaskState {

  final String trymsg;

  TryAgainState(this.trymsg);
}