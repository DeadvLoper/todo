import 'package:todo/core/constants/todo_constants.dart';

class Todo {
  final int id;
  final String title;
  final String body;
  final Priority priority;
  final DateTime createdAt;
  final bool isCompleted;

  const Todo({
    required this.id,
    required this.title,
    required this.body,
    required this.priority,
    required this.createdAt,
    required this.isCompleted,
  });
}

class TodoModel extends Todo {
  const TodoModel({
    required super.id,
    required super.title,
    required super.body,
    required super.priority,
    required super.createdAt,
    required super.isCompleted,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final Priority priority_ = Priority.values.firstWhere(
      (priority) => priority.name == json[kpriority],
    );
    return TodoModel(
      id: json[kid],
      title: json[ktitle],
      body: json[kbody],
      priority: priority_,
      createdAt: DateTime.parse(json[ktime]),
      isCompleted: json[kcompleted] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kid: id,
      ktitle: title,
      kbody: body,
      kpriority: priority.name,
      ktime: createdAt.toString(),
      kcompleted: isCompleted,
    };
  }
}

enum Priority { high, medium, low }
