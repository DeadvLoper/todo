import 'package:cookbook/providers/todos_provider.dart';
import 'package:cookbook/repositories/todo_repository.dart';
import 'package:cookbook/ui/pages/todos_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: TodosProvider(repository: TodoRepositoryImpl(), child: TodosPage()),
    ),
  );
}
