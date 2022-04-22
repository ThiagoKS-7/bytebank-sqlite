import 'package:flutter/material.dart';

class IcnTextField extends StatelessWidget {
  final IconData? icone;
  final String? topTitle;
  final Text? title;

  IcnTextField({this.icone, this.topTitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left:13, right:5),
          child:Icon(icone!, size: 30),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, right: 180.0),
              child: Text(topTitle!, style: TextStyle(fontSize: 16.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 196.0, bottom:0),
              child: title!,
            ),
          ],
        )
      ],
    );
  }
}

