import 'package:flutter/material.dart';

import 'package:todo/core/theme.dart';
import 'package:todo/ui/widgets/add_todo_widget.dart';
import 'package:todo/ui/widgets/todo_list_widget.dart';
import 'package:todo/ui/widgets/todos_analytics_widget.dart';

class TodosPage extends StatefulWidget {
  const TodosPage() : super(key: null);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Todo', style: TextStyle(color: AppTheme.secondaryColor)),
        backgroundColor: AppTheme.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              showMenu(
                position: RelativeRect.fromLTRB(1, 0, 0, 1),
                context: context,
                popUpAnimationStyle: AnimationStyle().copyWith(
                  curve: Curves.fastLinearToSlowEaseIn,
                ),
                items: [
                  PopupMenuItem(
                    child: AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(milliseconds: 300),
                      child: Text('THeme'),
                    ),
                  ),
                ],
              );
            },
            icon: Icon(Icons.menu_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: TodosAnalyticsWidget(),
                    ),
                  ),
                  Expanded(flex: 5, child: TodoListWidget()),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryColor,
        child: Icon(Icons.add, color: AppTheme.secondaryColor),
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
      builder: (ctx) => AddTodoWidget(),
    );
  }
}
