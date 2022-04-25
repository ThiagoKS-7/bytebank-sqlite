
import 'package:bytebank/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/pages/Home.dart';

void main() {
  runApp(const BytebankApp());
  // retorna o resultado de uma inserção
    //findAllContacts().then((contacts) => debugPrint(contacts.toString()));
    //print("[INFO] Done!");
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bytebank',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      home: const Home(title: 'Bytebank app'),
    );
  }
}