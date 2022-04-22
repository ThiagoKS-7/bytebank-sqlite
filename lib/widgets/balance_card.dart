import 'package:bytebank/theme/colors.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({ Key? key, required this.cardData}) : super(key: key);
  final cardData;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.only(left: 20, right: 0, top:20, bottom:20),
        width: 370,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          // color: primary.withOpacity(.4),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
            colors: [
              cardColor.withOpacity(.3),
              cardColor
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            //Text(cardData["balance"], maxLines: 1, overflow: TextOverflow.fade, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:230),
                  child: Image.asset('images/bytebank.png',
                      fit: BoxFit.fill, height: 30),
                ),
                SizedBox(height: 20),
                Container(
                  child: Image.asset('images/visa.png',
                      fit: BoxFit.fill, height: 30),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text("**** **** **** 6800", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                        ),
                      ],
                    ),
                    SizedBox(height: 35,),
                    Row(
                      children:[
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:35),
                              child: Text("CARD HOLDER", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                            ),
                            Text("THIAGO K. SOUZA", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:40,),
                              child: Text("EXPIRE DATE", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10),
                              child:Text("08/30", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:56),
                              child: Text("CVV", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:56),
                              child:Text("687", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
                            ),

                          ],
                        ),
                      ]
                    ),
                  ],
                ),
              ],
            ),
        ],
        )
      );
  }
}
