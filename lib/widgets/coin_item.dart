import 'package:bytebank/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'avatar_image.dart';

List<Color> stateColors = [stayColor, darkUpColor, downColor];
class CoinItem extends StatelessWidget {
  const CoinItem(this.coinData, { Key? key, this.onTap}) : super(key: key);
  final coinData;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: shadowColor.withOpacity(0.6),
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
            child: Column(
              children: [
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AvatarImage(
                      coinData['image'],
                      isSVG: false,
                      width: 30, height:30,
                      radius: 50,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child:
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(coinData['name'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                                )
                              ),
                              SizedBox(width: 5),
                              Container(
                                child: Text(coinData['price'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(coinData['name_abb'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13,))
                                ),
                              ),
                              Container(
                                child: Text(coinData['change'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: stateColors[coinData['state']]))
                              )
                            ],
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}