import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';

class SQL_Functions {
  //create database
  static Future<sql.Database> OpenDb() async {
    return sql.openDatabase('mycontacts', version: 1,
        onCreate: (sql.Database db, int version) async {
      await createTable(db);
    });
  }

  //create Table
  static Future<void> createTable(sql.Database db) async {
    await db.execute(
        'CREATE TABLE contact (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, cname TEXT,  cnumber TEXT)');
  }

  static Future<int> addnewContact(String name, String number) async {
    final db = await SQL_Functions.OpenDb();
    final data = {'cname': name, 'cnumber': number};
    final id = await db.insert('contact', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> readContact() async {
    final db = await SQL_Functions.OpenDb();
    return db.query('contact', orderBy: 'id');
  }

  static Future<int> updateContactt(int id, String name, String num) async {
    final db = await SQL_Functions.OpenDb();
    final updateddata = {"cname": name, "cnumber": num};
    final updatedid =
        db.update("contact", updateddata, where: "id=?", whereArgs: [id]);
    return updatedid;
  }

  static Future<void> removeContact(int id) async {
    final db = await SQL_Functions.OpenDb();
    try {
      await db.delete("contact", where: "id=?", whereArgs: [id]);
    } catch (e) {
      print("Something went wrong $e");
    }
  }
}
