import 'package:cookbook/core/theme.dart';
import 'package:cookbook/models/todo.dart';
import 'package:cookbook/providers/todos_provider.dart';
import 'package:cookbook/ui/widgets/animated_opacity_widget.dart';
import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({required this.todo}) : super(key: null);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacityWidget(
      child: Dismissible(
        key: ValueKey(todo.id),
        onDismissed: (d) {},
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: AppTheme.shadowColor, blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              TodosProvider.of(context).completeTodo(todo.id);
            },
            child: _buildRow(todo),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(Todo todo) {
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
        Icon(
          todo.isCompleted
              ? Icons.radio_button_checked
              : Icons.radio_button_off_outlined,
          color: AppTheme.primaryColor,

          size: 33,
        ),
      ],
    );
  }
}
