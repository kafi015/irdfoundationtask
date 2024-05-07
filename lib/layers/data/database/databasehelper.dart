import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static Future<List<Map<String,dynamic>>> getDataFromDatabase() async
  {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,'hadith_db.db');

    final exist = await databaseExists(path);

    if(exist)
      {
        //database already exists
        await openDatabase(path);
      }
    else
      {
        //db not exist. copy from assets
        print('Creating a copy from assets.');
        try
            {
              await Directory(dirname(path)).create(recursive: true);
            }catch(_){}

        ByteData data = await rootBundle.load(join('assets','hadith_db.db'));
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        await File(path).writeAsBytes(bytes, flush: true);
        print('db Copied');
      }
    final db = await openDatabase(path);
    return await db.query('books');
  }






  // static Future<Database> _openDatabase() async {
  //   final databasePath = await getDatabasesPath();
  //   final path = join(databasePath, 'hadith_db.db');
  //   return openDatabase(path,version: 1,onCreate: _createDatabase);
  // }
  //
  // static Future<void> _createDatabase(Database db, int version) async
  // {
  //   await db.execute('''
  //   CREATE TABLE IF NOT EXISTS users(
  //   id INTEGER PRIMARY KEY AUTOINCREMENT,
  //   name TEXT,
  //   age INTEGER
  //   )
  //   ''');
  // }
  //




}