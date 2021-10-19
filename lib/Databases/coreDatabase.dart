
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;




class CoreDatabases{
  static CoreDatabases _dbHelper = CoreDatabases._singleton();
  factory CoreDatabases() {
    return _dbHelper;
  }
  CoreDatabases._singleton();
  final tables = [
    UserTable.CREATE_TABLE,
  ];
  Future<Database> openDB() async {
    final dbPath = await sqlite.getDatabasesPath();
    return sqlite.openDatabase(
        path.join(dbPath, 'bestfrancihse.db'),
        onCreate: (db, version) {
          tables.forEach((table) async {
            await db.execute(table).then((value) {
              print("############################### created table $table");
            }).catchError((err) {
              print("errornya ${err.toString()}");
            });
          });
        },
        version: 1
    );
  }
  Future<List> getData(String tableName) async {
    final db = await openDB();
    var result = await db.rawQuery('SELECT * FROM $tableName');
    return result.toList();
  }
  Future<bool> insert(String table, Map<String, Object> data) async {
    try{
      final db = await openDB();
      await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
      print("############################# INSERT $table ##################################");
      return true;
    }
    catch(_){
      return false;
    }
  }

  Future<bool> update(String table,int id, Map<String, Object> data) async {
    try {
      final db = await openDB();
      await db.update(table, data, where: 'id = ?',whereArgs: [id],conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    }
    catch (_) {
      return false;
    }
  }
  Future<int> delete(String table) async {
    final db = await openDB();
    var result = await db.delete(table);
    print("############################# DELETE $table ##################################");
    return result;
  }

}