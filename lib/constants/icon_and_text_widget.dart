import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/small_text.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class IconandText extends StatelessWidget {
  IconandText({this.color=Colors.grey,this.iconcolor=Colors.cyan,this.icon,required this.text,this.iconsize=20});
  String text;
  Color color;
  IconData? icon;
  Color iconcolor;
  double iconsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconcolor,size: iconsize,),
        SizedBox(width: Dimensions.height10,),
        Smalltext(text: text,color: color,)
      ],
    );
  }
}
