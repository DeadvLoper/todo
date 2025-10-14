import 'package:cookbook/core/theme.dart';
import 'package:cookbook/providers/todos_provider.dart';
import 'package:cookbook/repositories/todo_repository.dart';
import 'package:cookbook/ui/pages/todos_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        inputDecorationTheme: InputDecorationTheme().copyWith(
          labelStyle: TextStyle(color: AppTheme.onPrimaryLight),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppTheme.primaryColorLight),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColorLight,
            foregroundColor: AppTheme.onPrimaryLight,
            minimumSize: Size(120, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      home: TodosProvider(repository: TodoRepositoryImpl(), child: TodosPage()),
    ),
  );
}
