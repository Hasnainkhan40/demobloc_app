import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddToaoEvent extends ToDoEvent {
  final String task;
  const AddToaoEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveToaoEvent extends ToDoEvent {
  final Object task;
  const RemoveToaoEvent({required this.task});

  @override
  List<Object> get props => [task];
}
