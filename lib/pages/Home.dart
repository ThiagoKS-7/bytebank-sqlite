import 'package:flutter/material.dart';
import 'package:bytebank/widgets/balance_card.dart';
import 'package:bytebank/widgets/coin_card.dart';
import 'package:bytebank/data/json.dart';
import 'package:bytebank/widgets/coin_item.dart';
import 'package:bytebank/theme/colors.dart';
import 'package:bytebank/pages/Init.dart';
import 'package:bytebank/pages/Extract.dart';
import 'package:bytebank/pages/Contacts.dart';


// classe home
class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  // declarando variaveis
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // muda o indice da lista
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // lista de widgets
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Init(),
    Lista_Extrato(),
    Lista_Contatos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
            height: 25,
            width: 25,
            margin: EdgeInsets.only(right: 10.0),
            child: Image.asset('images/bytebank.png',
                fit: BoxFit.fill, height: 10),
          ),
          Text("Bytebank"),
        ]),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right:10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:8),
                    child: Text("Thiago K. Souza"),
                  ),
                  Icon(Icons.account_circle_rounded, size:38),
                ],
              )
          ),

        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appBgColorPrimary,
                upColor
              ],
            ),
          ),
          child: _widgetOptions.elementAt(_selectedIndex)
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    appBgColorPrimary,
                    upColor
                  ],
                ),
              ),
              child: Text(
                'Bem vindo ao Bytebank',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: ()  {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.savings_rounded),
              title: Text('Dashboard'),
              onTap: ()  {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Extract List'),
              onTap: ()  {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Contacts'),
              onTap: ()  {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

HomePage(){
  return
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(height: 20,),
              getBalanceCards(),
              SizedBox(height: 25,),
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text("Sugestões para você:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
              ),
              SizedBox(height: 15,),
              getCoinCards(),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text("Seus ativos:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
              SizedBox(height: 15,),
              getNewCoins(),
            ]
        ),
      ),
    );
}

getBalanceCards(){
  return Center(child: BalanceCard(cardData: balanceCards[0]));
}

getCoinCards(){
  return SingleChildScrollView(
    padding: EdgeInsets.only(bottom: 5, left: 15),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(coins.length,
              (index) => CoinCard(cardData: coins[index])
      ),
    ),
  );
}

getNewCoins(){
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    child: Column(
        children: List.generate(coins.length,
                (index) => CoinItem(coins[index], onTap: () {
                  print("Teste");
                },)
        )
    ),
  );
}
