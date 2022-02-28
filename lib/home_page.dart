import 'dart:developer';

import 'package:af_sqlite/database_sqlite.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _databaseOpen();
  }

  Future<void> _databaseOpen() async {
    var db = await DatabaseSqlite().openConnection();
    // var result =
    //     await db.rawInsert('insert into teste(nome) values(?)', ['nome2']);
    // print(result);
    // var result2 = await db
    //     .rawUpdate('update teste set nome=? where id=?', ['nome1', '1']);
    // print(result2);
    // var result = await db.rawDelete('delete from teste where id=?', ['3']);
    var result = await db.rawQuery('select * from teste');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(),
    );
  }
}
