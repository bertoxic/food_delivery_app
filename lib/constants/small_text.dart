import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Smalltext extends StatelessWidget {
  Smalltext({required this.text,this.color=const Color(0xff767474),this.size=13,this.height=2});

  Color color;
  final String text;
  double size;
  double height;
  //TextOverflow? overflow;//=TextOverflow.ellipsis;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

     // textHeightBehavior: TextHeightBehavior(leadingDistribution: TextLeadingDistribution.even),
      softWrap: true,
      style: TextStyle(
          color:color,
          fontSize: size,
         height: height,
         // fontWeight: FontWeight.w400,
          //overflow: overflow,
      ),
    );
  }
}
