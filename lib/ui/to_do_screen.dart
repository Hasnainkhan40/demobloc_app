import 'package:bolc/bloc/to_do_bloc.dart';
import 'package:bolc/bloc/to_do_event.dart';
import 'package:bolc/bloc/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});
  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (contaxt, state) {
          if (state.todoList.isEmpty) {
            return const Center(child: Text('No Todo found'));
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ToDoBloc>().add(
                        RemoveToaoEvent(task: state.todoList[index]),
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          for (var i = 1; i < 5 + 1; i++) {
            context.read<ToDoBloc>().add(
              AddToaoEvent(task: 'Task: ' + i.toString()),
            );
          }
        },
      ),
    );
  }
}
