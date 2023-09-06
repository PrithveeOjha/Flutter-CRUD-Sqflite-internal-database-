import 'package:sqflite/sqflite.dart';

class UserRepo {
  void createTable(Database? db){
    db?.execute("CREATE TABLE IF NOT EXISTS USER(id INTEGER PRIMARY KEY, email TEXT, password TEXT)");
  }

  Future<void> getUsers(Database? db) async{
    final List<Map<String, dynamic>> maps = await db!.query('User');

    print(maps);
  }
}