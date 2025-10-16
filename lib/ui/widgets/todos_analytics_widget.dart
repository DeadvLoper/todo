import 'package:cookbook/core/classes/app_state.dart';
import 'package:cookbook/core/theme.dart';
import 'package:cookbook/models/todo.dart';
import 'package:cookbook/providers/todos_provider.dart';
import 'package:cookbook/ui/widgets/animated_progress_bar.dart';
import 'package:flutter/material.dart';

class TodosAnalyticsWidget extends StatelessWidget {
  const TodosAnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppState<List<Todo>>? state = TodosProvider.of(context).todoState;
    final List<Todo> todos = state == null ? [] : state.data ?? [];
    return Container(
      decoration: BoxDecoration(
      color: AppTheme.surfaceColorLight,
        border: Border.all(color: AppTheme.primaryColor, width: 4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAnalyticsItem(
              'Completed',
              icon: Icons.check,
              value: todos.where((todo) => todo.isCompleted).length,
              total: todos.length,
            ),
            _buildAnalyticsItem(
              'Remaining',
              icon: Icons.cancel,
              value: todos.where((todo) => !todo.isCompleted).length,
              total: todos.length,
            ),
            _buildAnalyticsItem(
              'Total Todos',
              icon: Icons.data_array,
              value: todos.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsItem(
    String title, {
    int? total,
    required IconData icon,
    required int value,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.secondaryColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          // Icon(icon),
          // const SizedBox(height: 10),
          Text(
            value.toString(),
            style: AppTheme.numberTextTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          if (total != null)
            AnimatedProgressBar(progress: value != 0 ? value / total : 0),
        ],
      ),
    );
  }
}
