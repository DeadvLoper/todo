import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/ui/widgets/todo_widget.dart';

void main() async {
  testWidgets('tests todo widget', (tester) async {
    await tester.pumpWidget(const TodoWidgetTest());

    final titleFinder = find.text('Todo title');
    final bodyFinder = find.text('Todo body');

    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
  });
}

final Todo dummyTodo = Todo(
  id: 0,
  title: 'Todo title',
  body: 'Todo body',
  priority: Priority.high,
  createdAt: DateTime.now(),
  isCompleted: false,
);

class TodoWidgetTest extends StatelessWidget {
  const TodoWidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: TodoWidget(todo: dummyTodo)),
      ),
    );
  }
}
