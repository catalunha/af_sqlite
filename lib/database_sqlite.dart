import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  Future<void> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databasePathFinal = join(databasePath, 'db_af_sqlite');
    // print(databasePathFinal);
    openDatabase(
      databasePathFinal,
      version: 1,
      onConfigure: (db) async {
        log('ccc> DatabaseSqlite.openDatabase.onConfigure');
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (Database db, int version) {
        final batch = db.batch();
        batch.execute(
            'create table teste (id Integer primary key autoincrement, nome varchar(200))');
        batch.commit();
        log('ccc> DatabaseSqlite.openDatabase.onCreate');
      },
      onUpgrade: (Database db, int oldVersion, int version) {
        if (oldVersion == 1) {
          final batch = db.batch();
          batch.execute(
              'create table produto (id Integer primary key autoincrement, nome varchar(200))');
          batch.commit();
        }
        log('ccc> DatabaseSqlite.openDatabase.onUpgrade');
      },
      onDowngrade: (Database db, int oldVersion, int version) {
        if (oldVersion == 1) {
          final batch = db.batch();
          batch.execute('drop table produto');
          batch.commit();
        }
        log('ccc> DatabaseSqlite.openDatabase.onDowngrade');
      },
    );
  }
}
