import 'package:cookbook/core/classes/app_state.dart';
import 'package:cookbook/models/todo.dart';
import 'package:cookbook/providers/todos_provider.dart';
import 'package:cookbook/ui/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget() : super(key: null);

  @override
  Widget build(BuildContext context) {
    final AppState<List<Todo>>? state = TodosProvider.of(context).todoState;

    return switch (state) {
      DataState(:final value) => ListView.builder(
        itemCount: value.length,
        itemBuilder: (ctx, index) => TodoWidget(todo: value[index]),
      ),
      ErrorState() => Text("An Error occurred!"),
      LoadingState() => Center(child: CircularProgressIndicator()),
      null => Text("No Todos Found"),
    };
  }
}
