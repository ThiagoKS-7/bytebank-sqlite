import 'package:flutter/material.dart';
import 'package:bytebank/widgets/GenericTextField.dart';
import 'package:bytebank/models/Contato.dart';
import 'package:bytebank/theme/colors.dart';
import 'package:bytebank/data/json.dart';
import 'package:bytebank/widgets/avatar_image.dart';

/* FEATURE DE TRANSFERENCIAS | EXTRATOS */

// Responsavel por incluir a nova transferencia
class Contact extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorNumero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(right: 15.0),
            child: Image.asset('images/bytebank.png',
                fit: BoxFit.fill, height: 10),
          ),
          Text("Contatos"),
        ]),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appBgColorPrimary,
                upColor
              ],
            ),
          ),
          child: Column(
            children: [
              Editor(controlador: _controladorNome,
                label: 'Nome',
                hint: 'Homer J. Simpson',
                icone: Icons.people,
                type: TextInputType.text,
              ),
              Editor(controlador: _controladorNumero,
                label: 'Número',
                hint: '9 9999-9999',
                type: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: () => _criaContato(context),
                  child: Text("Confirmar")),
              SizedBox(height: 500,),
            ],

          ),
        ),
      ),
    );
  }

  void _criaContato(BuildContext context) {
    final String? nome = _controladorNome.text;
    final String numero = _controladorNumero.text;
    if (nome != null && numero != null) {
      final contatoCriado = Contato(nome, numero);
      debugPrint('$contatoCriado');
      Navigator.pop(context, contatoCriado);
    }
  }
}

// Mostra as transf na tela
class Lista_Contatos extends StatefulWidget {
  final List<Contato> _contatos = List.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<Lista_Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              appBgColorPrimary,
              upColor
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: widget._contatos.length,
          itemBuilder:(context, indice) {
            final contato = widget._contatos[indice];
            return Item_Contato(contato);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(
              context, MaterialPageRoute(builder: (context) {
            return Contact();
          }));
          future.then((contRecebido) {
            if (contRecebido != null) {
              setState(() =>widget._contatos.add(contRecebido));
            }
          });
        },
        tooltip: 'Novo Contato',
        child: const Icon(Icons.add),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Um dos Cards de extrato
class Item_Contato extends StatelessWidget {
  final Contato _contato;

  Item_Contato(this._contato);

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          SizedBox(height: 10),
          Container(
          decoration: BoxDecoration(
            color: shadowColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: AvatarImage(
              balanceCards[0]['image'],
              isSVG: false,
              width: 30, height:30,
              radius: 50,
            ),
            title: Text(_contato.nome,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6),
            subtitle: Text(_contato.numero
                .toString()), // mas se tiver variável dentro nem faz sentido chamar ele de const
          ),
        )]);
  }
}


