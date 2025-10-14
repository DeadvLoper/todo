import 'package:cookbook/models/todo.dart';
import 'package:cookbook/services/todo_service.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
}

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<Todo>> getTodos() async {
    final LocalTodoService localTodoService = LocalTodoServiceImpl();
    return await localTodoService.fetchTodos();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final LocalTodoService localTodoService = LocalTodoServiceImpl();
    await localTodoService.addTodo(todo);
  }
}
