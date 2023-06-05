import 'package:db_lab_project/tool/applayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class databasehelper{

  static Future<List> openDatabaseAndPerformQueries(String query) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'hospital.db');
    var database = await openDatabase(path);
    List<Map<String, dynamic>> results = await database.rawQuery(query);
    await database.close();
    return results;
  }

  static Future<void> insertdata(String name,String loc,String fac) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'hospital.db');
    var database = await openDatabase(path);
    await database.insert(
      'department',
      {'department_name': name, 'department_location': loc,'department_facility':fac},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await database.close();
  }

  static Future<void> updatedata(String name,String loc,String fac,int id) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'hospital.db');
    var database = await openDatabase(path);
    await database.update(
      'department',
      {'department_name': name, 'department_location': loc,'department_facility':fac},
      where: 'department_id = ?',
      whereArgs: [id],
    );
    await database.close();
  }

  static Future<void> deletedata(int id) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'hospital.db');
    var database = await openDatabase(path);
    await database.delete(
      'department',
      where: 'department_id = ?',
      whereArgs: [id],
    );
    await database.close();
  }

}