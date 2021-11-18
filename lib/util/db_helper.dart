import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class DBHelper
{
   Database? _db;
  final String dbName = 'Student';

  DBHelper._privateConstructor();
   static final  DBHelper instance = DBHelper._privateConstructor();

   Future<Database> get db async
  {
    if(_db == null) {
      _db = await initializeDb();
    }
    return  _db!;
  }

   initializeDb() async
   {
     Directory directory = await getApplicationDocumentsDirectory();
     String path = join(directory.path, dbName);
     return await openDatabase(path, version: 2, onCreate: _onCreate);
  }




   _onCreate(Database db, int version) async {
     await db.execute(
       '''
       Create Table `user`
       (
        id Integer primary key autoincrement,
        username text,
        password text,
        email text
       );
       '''
     );
     await db.execute(
         '''
       CREATE TABLE Students (
    id            INTEGER PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    StudentName   TEXT    NOT NULL,
    Email         TEXT    NOT NULL,
    Password      TEXT    NOT NULL,
    Department    TEXT    NOT NULL,
    ClassID       TEXT    NOT NULL,
    RegNo         TEXT    NOT NULL,
    RollNo        TEXT    NOT NULL,
    RecoveryEmail TEXT    NOT NULL
);

       '''
     );
     await db.execute(
         '''
              CREATE TABLE Classes (
              ClassID   INTEGER PRIMARY KEY AUTOINCREMENT,
              ClassName TEXT
                );

       '''
     );
  }

  Future<int> insertQuery(String query) async
  {
    Database database = await db;
    var id = await database.rawInsert(query);
    print("id : $id");
    return id;
  }

   Future<int> updateQuery(String query) async
   {
     Database database = await db;
     var id = await database.rawUpdate(query);
     print("id : $id");
     return id;
   }

   Future<int> deleteQuery(String query) async
   {
     Database database = await db;
     var id = await database.rawDelete(query);
     print("id : $id");
     return id;
   }

   Future<bool> userAuthenticate(String query) async
   {
     Database database = await db;
     var res = await database.rawQuery(query);
     if(res.isNotEmpty)
       {
         return true;
       }
     else
       {
         return false;
       }
   }
}