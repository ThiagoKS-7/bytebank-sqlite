import 'package:bytebank/models/Contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//CRIA UM DB COM AS SUAS RESPECTIVAS TABELAS
Future<Database> createDatabase() {
  //gera uma promise (PRECISA SER FUTURE, DEVE RETORNAR THEN E O OPEN)
  return getDatabasesPath().then((dbPath) {
    //junta a string do path ao db
    final String path = join(dbPath, 'bytebank.db');
    //abrir db, criando tabelas com sql injection usando o execute()
    return openDatabase(path, onCreate: (db, version) {
      db.execute("CREATE TABLE contacts("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "account_number INTEGER)");
    }, version: 1);
  });
}

//CRIA UM CONTATO A PARTIR DOS PARAMETROS RECEBIDOS
Future<int> save(Contato contact) {
  //gera uma promise (PRECISA SER FUTURE, DEVE RETORNAR THEN E O INSERT)
  return createDatabase().then((db) {
    //fazer mapa do db
    print("[INFO] Salvando registro...");
    final Map<String, dynamic> contactMap = Map();
    //mapear a var contact a partir do contactMap
    contactMap['name'] = contact.nome;
    contactMap['account_number'] = contact.numero;

    //insert na tabela contacts
    return db.insert('contacts', contactMap);
  });
}

//FUNCAO PRA BUSCAR TODAS AS INFORMAÇÕES
Future<List<Contato>> findAllContacts() {
  //retorna promise (retornar todos os then e a lista)
  print("[INFO] Encontrando registros...");
  return createDatabase().then((db) {
    //é o select pra tudo na col contacts
    return db.query('contacts').then((maps) {
      final List<Contato> contacts = [];
      //varre os mapas pra colocar na lista de contatos
      for (Map<String, dynamic> map in maps) {
        final Contato contact = Contato(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
