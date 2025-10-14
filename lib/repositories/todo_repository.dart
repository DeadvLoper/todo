import 'package:cookbook/models/todo.dart';
import 'package:cookbook/services/todo_service.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
}

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<Todo>> getTodos() async {
    final LocalTodoService localTodoService = LocalTodoServiceImpl();
    return await localTodoService.fetchTodos();
  }
}
