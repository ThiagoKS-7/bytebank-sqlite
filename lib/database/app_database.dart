import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Data Access Object - DAO

//CRIA UM DB COM AS SUAS RESPECTIVAS TABELAS
Future<Database> getDatabase() async {
  //da pra fazer com async await :3
  String path = join(await getDatabasesPath(), 'bytebank.db');
  //abrir db, criando tabelas com sql injection usando o execute()
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDao.tableSql);
  }, version: 1);
}


