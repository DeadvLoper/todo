import 'package:cookbook/core/classes/app_state.dart';
import 'package:cookbook/core/theme.dart';
import 'package:cookbook/models/todo.dart';
import 'package:cookbook/providers/todos_provider.dart';
import 'package:cookbook/ui/widgets/custom_dropdown_widget.dart';
import 'package:cookbook/ui/widgets/todo_list_widget.dart';
import 'package:cookbook/ui/widgets/todos_analytics_widget.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  const TodosPage() : super(key: null);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Todo', style: TextStyle(color: AppTheme.secondaryColor)),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: TodosAnalyticsWidget(),
                ),
              ),
              const Divider(),
              Expanded(flex: 5, child: TodoListWidget()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo(context);
        },
      ),
    );
  }

  void addTodo(BuildContext context) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.8,
      enableDrag: true,
      context: context,
      builder: (ctx) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 15),
                TextField(
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
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      CustomDropdownWidget(
                        items: Priority.values.map((v) => v.name).toList(),
                        onChanged: (c) {},
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
                          : state.data!.last.id;

                      final Todo newTodo = Todo(
                        id: lastTodoId + 1,
                        title: _title.text,
                        body: _body.text,
                        priority: Priority.high,
                        createdAt: DateTime.now(),
                        isCompleted: false,
                      );
                      TodosProvider.of(context).addTodo(newTodo);
                    },
                    label: Text('Add Todo'),
                    icon: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
