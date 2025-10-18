import 'package:todo/core/theme.dart';
import 'package:todo/providers/todos_provider.dart';
import 'package:todo/repositories/todo_repository.dart';
import 'package:todo/ui/pages/todos_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    TodosProvider(
      repository: TodoRepositoryImpl(),
      child: MaterialApp(theme: AppTheme.theme, home: TodosPage()),
    ),
  );
}
