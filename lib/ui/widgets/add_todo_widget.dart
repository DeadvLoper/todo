import 'package:cookbook/core/classes/app_state.dart';
import 'package:cookbook/core/theme.dart';
import 'package:cookbook/models/todo.dart';
import 'package:cookbook/providers/todos_provider.dart';
import 'package:cookbook/ui/widgets/dragable_widget.dart';
import 'package:flutter/material.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => AddTodoState();
}

class AddTodoState extends State<AddTodoWidget> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();

  Priority priority = Priority.high;

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.surfaceColorLight,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 15),
            TextField(
              autofocus: true,
              controller: _title,
              decoration: InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _body,
              decoration: InputDecoration(label: Text('Description')),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Select Priority',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  DragableWidget(
                    items: Priority.values.map((todo) => todo.name).toList(),
                    onChanged: (selected) {
                      priority = Priority.values[selected];
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  final AppState<List<Todo>>? state = TodosProvider.of(
                    context,
                  ).todoState;

                  int lastTodoId = state == null
                      ? 0
                      : state.data == null
                      ? 0
                      : state.data!.isEmpty
                      ? 0
                      : state.data!.first.id;

                  final Todo newTodo = Todo(
                    id: lastTodoId + 1,
                    title: _title.text,
                    body: _body.text,
                    priority: priority,
                    createdAt: DateTime.now(),
                    isCompleted: false,
                  );
                  TodosProvider.of(context).addTodo(newTodo);
                  Navigator.of(context).pop();
                },
                label: Text('Add Todo'),
                icon: Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
