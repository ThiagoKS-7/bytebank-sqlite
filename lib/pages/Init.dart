import 'package:flutter/material.dart';
import 'package:bytebank/widgets/GenericFAButton.dart';
import 'package:bytebank/widgets/GenericAccountHeader.dart';
import 'package:bytebank/theme/colors.dart';

class Init extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Conteudo_inicio()
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Conteudo_inicio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            appBgColorPrimary,
            upColor
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AccHeader(balance: '500,00', savedMoney: '3500,00'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left:13),
                child:Icon(Icons.auto_graph_rounded, size: 30),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, right: 240.0),
                    child: Text('Rendimento', style: TextStyle(fontSize: 16.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 236.0),
                    child: Text(' + R\$ 3,50',
                        style: TextStyle(fontSize: 24.0, color: darkUpColor),
                    ),
                  ),
                ],
              )
            ],
          ),

          Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ButtonsMenu()
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
              child: Container(
                decoration: BoxDecoration(
                  color:shadowColor.withOpacity(0.4),
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
                        leading: Icon(Icons.credit_card, size: 40),
                        title: Text('Meus cartões'),
                        subtitle: Text('Clique para acessar'),
                        onTap: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text("Meus cartões")))
                    ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
              child: Container(
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
                    leading: Icon(Icons.attach_money, size: 40),
                    title: Text('Limite de empréstimo'),
                    subtitle: Text('R\$ 20.000,00'),
                    onTap: () =>  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Empréstimo")))
                ),
              ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
