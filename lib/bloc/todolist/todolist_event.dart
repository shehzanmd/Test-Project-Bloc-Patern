part of 'todolist_bloc.dart';

@immutable
abstract class TodolistEvent {}

class AddTodoEvent extends TodolistEvent {
  final String task;

  AddTodoEvent(this.task);
}

class EditTodoEvent extends TodolistEvent {
  final int index;
  final String newTask;

  EditTodoEvent(this.index, this.newTask);
}

class DeleteTodoEvent extends TodolistEvent {
  final int index;

  DeleteTodoEvent(this.index);
}