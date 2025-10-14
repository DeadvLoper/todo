import 'package:cookbook/core/theme.dart';
import 'package:cookbook/models/todo.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({required this.todo}) : super(key: null);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (d) {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: _buildRow(todo),
        ),
      ),
    );
  }

  Widget _buildRow(Todo todo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(todo.title, style: TextStyle(color: AppTheme.secondaryColorLight)),
        Icon(Icons.radio_button_off_outlined, size: 33),
      ],
    );
  }
}
