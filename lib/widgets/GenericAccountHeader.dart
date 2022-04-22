import 'package:flutter/material.dart';
import 'package:bytebank/widgets/GenericIconTextField.dart';

class AccHeader extends StatelessWidget {
  String? balance;
  String? savedMoney;


  AccHeader({this.balance, this.savedMoney});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 54.0, right: 235.0),
          child: Text('Saldo Disponível', style: TextStyle(fontSize: 16.0)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 156.0),
          child: Text('R\$' + balance!, style: TextStyle(fontSize: 48.0)),
        ),
        IcnTextField(
          topTitle: 'Dinheiro guardado',
          title: Text('R\$' + savedMoney!, style: TextStyle(fontSize: 24.0)),
          icone: Icons.account_balance_wallet_outlined,
        ),
      ],
    );
  }
}



