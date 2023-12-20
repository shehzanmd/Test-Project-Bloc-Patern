import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todolist_event.dart';
part 'todolist_state.dart';

class TodolistBloc extends Bloc<TodolistEvent, TodolistState> {
  final List<String> _tasks = [];

  TodolistBloc() : super(TodolistInitial(const [])) {
    on<TodolistEvent>((event, emit) {
      if (event is AddTodoEvent) {
        _tasks.add(event.task);
      } else if (event is EditTodoEvent) {
        _tasks[event.index] = event.newTask;
      } else if (event is DeleteTodoEvent) {
        _tasks.removeAt(event.index);
      }
      emit(TodolistInitial(List.from(_tasks)));

    });
  }
}