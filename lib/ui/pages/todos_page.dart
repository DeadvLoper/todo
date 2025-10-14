import 'package:cookbook/core/theme.dart';
import 'package:cookbook/ui/widgets/todo_list_widget.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatelessWidget {
  const TodosPage() : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColorLight,
      appBar: AppBar(title: Text('Todo')),
      body: Center(child: TodoListWidget()),

    );
  }
}
