part of 'todolist_bloc.dart';

@immutable
abstract class TodolistState {}

class TodolistInitial extends TodolistState {

  final List<String> tasks;

  TodolistInitial(this.tasks);

}

