import 'package:cookbook/core/classes/app_state.dart';
import 'package:cookbook/models/todo.dart';
import 'package:cookbook/repositories/todo_repository.dart';
import 'package:flutter/material.dart';

class TodosProvider extends StatefulWidget {
  const TodosProvider({required this.repository, required this.child})
    : super(key: null);
  final TodoRepository repository;
  final Widget child;

  @override
  State<TodosProvider> createState() => TodosState();

  static TodosState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedWidget>()!
        .state;
  }
}

class TodosState extends State<TodosProvider> {
  AppState<List<Todo>>? todoState;

  Future<void> getTodos() async {
    try {
      final List<Todo> todos = await widget.repository.getTodos();
      setState(() {
        todoState = DataState(value: todos);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      setState(() {
        todoState = LoadingState();
      });
      await widget.repository.addTodo(todo);
      final List<Todo> todos = await widget.repository.getTodos();
      setState(() {
        todoState = DataState(value: todos);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> completeTodo(int id) async {
    try {
      await widget.repository.completeTodo(id);
      List<Todo> todos = List.from(
        todoState != null ? todoState!.data ?? [] : [],
      );
      todos = todos.map((todo) {
        if (todo.id == id) {
          return Todo(
            id: id,
            title: todo.title,
            body: todo.body,
            priority: todo.priority,
            createdAt: todo.createdAt,
            isCompleted: todo.isCompleted ? false : true,
          );
        }
        return todo;
      }).toList();

      setState(() {
        todoState = DataState(value: todos);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedWidget(state: this, child: widget.child);
  }
}

class _InheritedWidget extends InheritedWidget {
  final TodosState state;
  const _InheritedWidget({required this.state, required super.child});

  @override
  bool updateShouldNotify(_InheritedWidget old) {
    // return old.state.todoState != state.todoState;
    return true;
  }
}
