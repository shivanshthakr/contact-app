

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:async';

class DBhelper {
  static Future<sql.Database> database() async {
    final dbpath = await sql.getDatabasesPath();
    return sql.openDatabase(join(dbpath, 'contacts_database.db'), version: 1,
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contacts(id TEXT PRIMARY KEY ,number TEXT,image TEXT ,firstname Text,lastname Text )');
    });
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DBhelper.database();
    db.insert(table, data);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBhelper.database();
    return db.query(table);
  }

  static Future<void> delete(String table, String id) async {
    final db = await DBhelper.database();
    await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<void> update(String table, Map<String, dynamic> data) async {
    final db = await DBhelper.database();
    await db.update(
      table, data, where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [data['id']],
    );
  }
}
