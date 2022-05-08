import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/small_text.dart';

import '../utils/dimensions.dart';
import 'appColors.dart';
import 'big_Text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
   AppColumn({required this.text});
   String text;

  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:text,size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(children: List.generate(5, (index) => Icon(Icons.star,color:AppColors.mainColor,size: 18,),) ),
            SizedBox(width: Dimensions.width15,),
            Smalltext(text: '4.5',color: Colors.grey.shade500,),
            SizedBox(width: Dimensions.width15,),
            Smalltext(text: '1923',color: Colors.grey.shade500,),
            SizedBox(width: Dimensions.width15,),
            Smalltext(text: 'Comments',color: Colors.grey.shade500,),],),
        SizedBox(height: Dimensions.height15,),
        Padding(
          padding:  EdgeInsets.only(left: 0.0,right: 0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconandText(icon: Icons.circle,text: 'Normal',iconcolor:AppColors.yellowColor,),
              IconandText(icon: Icons.location_on,text: 'location',iconcolor:AppColors.mainColor,),
              IconandText(icon: Icons.timelapse_rounded,text: 'delivery time',)
            ],
          ),
        )
      ],
    );
  }
}
