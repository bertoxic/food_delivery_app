import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';



class BigText extends StatelessWidget {
  BigText({this.text,this.color=const Color(0xFF332d2b),this.size=0,this.overflow});

  Color color;
  String? text;
  double size;
  TextOverflow? overflow;//=TextOverflow.ellipsis;


  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
        style: TextStyle( fontFamily: 'Futura',
          color:color,
          fontSize: size==0?Dimensions.font20:size,
          fontWeight: FontWeight.w400,
          overflow: overflow
        ), maxLines: 1,
    );
  }
}
