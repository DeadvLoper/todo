import 'package:todo/core/classes/app_state.dart';
import 'package:todo/core/theme.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todos_provider.dart';
import 'package:todo/ui/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget() : super(key: null);

  @override
  Widget build(BuildContext context) {
    final AppState<List<Todo>>? state = TodosProvider.of(context).todoState;

    return switch (state) {
      DataState(:final value) => _buildTodoList(value),
      ErrorState() => Text("An Error occurred!"),
      LoadingState() => Center(child: CircularProgressIndicator()),
      null => Center(child: _noTodosText()),
    };
  }

  Widget _noTodosText() {
    return Text(
      'No Todos added',
      style: AppTheme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: AppTheme.secondaryColor,
      ),
    );
  }

  Widget _buildTodoList(List<Todo> todos) {
    if (todos.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.drafts, size: 33, color: AppTheme.secondaryColor),
            _noTodosText(),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: todos.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TodoWidget(todo: todos[index]),
      ),
    );
  }
}
