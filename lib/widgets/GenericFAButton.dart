import 'package:flutter/material.dart';

class ButtonsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleButton(desc: "Depositar", msg:"Teste snackbar realizado!", icone: Icons.savings_rounded),
        CircleButton(desc: "Pagar",msg:"Teste snackbar realizado!", icone: Icons.qr_code),
        CircleButton(desc: "Transferir", msg:"Teste snackbar realizado!", icone: Icons.send_to_mobile_outlined,),
        CircleButton(desc: "Empréstimo", msg:"Teste snackbar realizado!", icone: Icons.shop_2_rounded,),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  final String? desc;
  final String? msg;
  final IconData? icone;
  CircleButton({this.desc, this.msg, this.icone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg!)));

              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) {
              //   return Formulario_Transferencia();
              // }));
            },
            tooltip: desc,
            child: Icon(icone),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(desc!, style: TextStyle(fontSize: 16.0)),
        ),
      ],
    );
  }
}