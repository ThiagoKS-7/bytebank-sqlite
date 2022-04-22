import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  //IMPORTANTE: A VERSÃO NOVA DO FLUTTER EXIGE CHECAR COM TERNÁRIO OS TIPOS
  // OPCIONAIS
  // https://www.alura.com.br/artigos/flutter-null-safety
  final TextEditingController? controlador;
  final String? label;
  final String? hint;
  final IconData? icone;
  final TextInputType? type;

  Editor({this.controlador, this.label, this.hint, this.icone, this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            border: UnderlineInputBorder(),
            labelText: label,
            hintText: hint),
        keyboardType: type,
      ),
    );
  }
}