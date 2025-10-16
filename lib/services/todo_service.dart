import 'package:cookbook/models/todo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalTodoService {
  Future<List<Todo>> fetchTodos();
  Future<void> addTodo(Todo todo);
  Future<void> completeTodo(int id);
  Future<void> deleteTodo(int id);
}

class LocalTodoServiceImpl implements LocalTodoService {
  Future<Database> openDb() async {
    return await openDatabase(
      '${await getApplicationSupportDirectory()}/todos.db',
      version: 1,
      onCreate: (db, _) async {
        await db.execute(
          'CREATE TABLE TODOS(ID INT NOT NULL, TITLE TEXT NOT NULL, BODY TEXT NOT NULL, PRIORITY TEXT NOT NULL,IS_COMPLETED BOOL NOT NULL,CREATED_AT DATETIME NOT NULL)',
        );
      },
    );
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    final Database db = await openDb();
    final List<Map<String, dynamic>> todos = await db.query(
      'TODOS',
      orderBy: 'CREATED_AT',
    );
    await db.close();
    return todos.map((json) => TodoModel.fromJson(json)).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final Database db = await openDb();
    await db.insert(
      'TODOS',
      TodoModel(
        id: todo.id,
        title: todo.title,
        body: todo.body,
        priority: todo.priority,
        createdAt: todo.createdAt,
        isCompleted: todo.isCompleted,
      ).toJson(),
    );
    await db.close();
  }

  @override
  Future<void> completeTodo(int id) async {
    final Database db = await openDb();
    await db.execute('UPDATE TODOS SET IS_COMPLETED = TRUE WHERE ID = $id');
    await db.close();
  }

  @override
  Future<void> deleteTodo(int id) async {
    final Database db = await openDb();
    await db.execute('DELETE FROM TODOS WHERE ID = $id');
    await db.close();
  }
}
