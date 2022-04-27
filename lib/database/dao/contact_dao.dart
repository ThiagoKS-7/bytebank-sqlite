import 'package:bytebank/models/Contato.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao {
  //SCRIPT DA TABELA
  static const String tableSql = "CREATE TABLE  $_tableName("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      "account_number INTEGER)";

  static const String  _tableName = 'contacts';
  static const String  _id = 'id';
  static const String  _name = 'name';
  static const String  _accountNumber = 'account_number';

  //CRIA UM CONTATO A PARTIR DOS PARAMETROS RECEBIDOS
  Future<int> save(Contato contact) async {
    // await da variavel Database
    final Database db = await getDatabase();
    print("[INFO] Salvando registro...");
    Map<String, dynamic> contactMap = _toMap(contact);

    //insert na tabela contacts
    return db.insert( _tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contato contact) {
     final Map<String, dynamic> contactMap = Map();
    //mapear a var contact a partir do contactMap
    contactMap[_name] = contact.nome;
    contactMap[_accountNumber] = contact.numero;
    return contactMap;
  }

  //FUNCAO PRA BUSCAR TODAS AS INFORMAÇÕES
  Future<List<Contato>> findAllContacts() async {
    //retorna promise (retornar todos os then e a lista)
    print("[INFO] Encontrando registros...");
    final Database db = await getDatabase();
    final List<Map<String,dynamic>> result = await db.query( _tableName);
    List<Contato> contacts = _toList(result);
    return
      contacts;
  }

  List<Contato> _toList(List<Map<String, dynamic>> result) {
     final List<Contato> contacts = [];
    //varre os mapas pra colocar na lista de contatos
    for (Map<String, dynamic> row in result) {
      final Contato contact = Contato(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}