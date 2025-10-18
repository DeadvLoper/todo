import 'package:todo/core/theme.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todos_provider.dart';
import 'package:todo/ui/widgets/animated_opacity_widget.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({required this.todo}) : super(key: null);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacityWidget(
      child: Dismissible(
        key: ValueKey(todo.id),
        onDismissed: (d) {
          TodosProvider.of(context).deleteTodo(todo.id);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: AppTheme.shadowColor, blurRadius: 10)],
            borderRadius: BorderRadius.circular(15),
          ),
          child: _buildRow(todo, context),
        ),
      ),
    );
  }

  Widget _buildRow(Todo todo, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                todo.title,
                style: AppTheme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              todo.body,
              style: AppTheme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.5,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            TodosProvider.of(context).completeTodo(todo.id);
          },
          child: Icon(
            todo.isCompleted
                ? Icons.radio_button_checked
                : Icons.radio_button_off_outlined,
            color: AppTheme.primaryColor,

            size: 33,
          ),
        ),
      ],
    );
  }
}
