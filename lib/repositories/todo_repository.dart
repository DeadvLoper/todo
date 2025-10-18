import 'package:todo/models/todo.dart';
import 'package:todo/services/todo_service.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> completeTodo(int id);
  Future<void> deleteTodo(int id);
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

  @override
  Future<void> completeTodo(int id) async {
    final LocalTodoService localTodoService = LocalTodoServiceImpl();
    await localTodoService.completeTodo(id);
  }

  @override
  Future<void> deleteTodo(int id) async {
    final LocalTodoService localTodoService = LocalTodoServiceImpl();
    await localTodoService.deleteTodo(id);
  }
}
