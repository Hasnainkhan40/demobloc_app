import 'package:bloc/bloc.dart';
import 'package:bolc/bloc/to_do_event.dart';
import 'package:bolc/bloc/to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoList = [];

  ToDoBloc() : super(const ToDoState()) {
    on<AddToaoEvent>(_addToDoEvent);
    on<RemoveToaoEvent>(_removeToDoEvent);
  }

  void _addToDoEvent(AddToaoEvent event, Emitter<ToDoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeToDoEvent(RemoveToaoEvent event, Emitter<ToDoState> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
