import 'package:cookbook/models/todo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalTodoService {
  Future<List<Todo>> fetchTodos();
}

class LocalTodoServiceImpl implements LocalTodoService {
  Future<Database> openDb() async {
    return await openDatabase(
      '${await getApplicationDocumentsDirectory()}/todos.db',
      onCreate: (db, _) async {
        await db.execute(
          'CREATE TABLE TODOS(ID INT NOT NULL, TITLE TEXT NOT NULL, BODY TEXT NOT NULL, PRIORITY TEXT NOT NULL,CREATED_AT DATETIME NOT NULL)',
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
    return todos.map((json) => TodoModel.fromJson(json)).toList();
  }
}
