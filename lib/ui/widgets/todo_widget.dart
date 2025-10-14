import 'package:cookbook/models/todo.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({required this.todo}) : super(key: null);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(),
      child: _buildRow(todo),
    );
  }

  Widget _buildRow(Todo todo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text(todo.title), Icon(Icons.radio_button_off_outlined)],
    );
  }
}
