import 'package:cookbook/core/constants/todo_constants.dart';

class Todo {
  final int id;
  final String title;
  final String body;
  final Priority priority;
  final DateTime createdAt;

  const Todo({
    required this.id,
    required this.title,
    required this.body,
    required this.priority,
    required this.createdAt,
  });
}

class TodoModel extends Todo {
  const TodoModel({
    required super.id,
    required super.title,
    required super.body,
    required super.priority,
    required super.createdAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final Priority priority_ = Priority.values.firstWhere(
      (pri) => pri.name == json[priority],
    );
    return TodoModel(
      id: json[id],
      title: json[title],
      body: json[body],
      priority: priority_,
      createdAt: DateTime.parse(json[time]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      id: this.id,
      title: this.title,
      body: this.body,
      priority: this.priority.name,
      time: createdAt.toString(),
    };
  }
}

enum Priority { high, medium, low }
