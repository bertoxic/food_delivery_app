import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/appColors.dart';
import 'package:food_delivery_app/constants/small_text.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
   ExpandableTextWidget({required this.text});
   String text;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstText;
  late String secondText;
  bool hiddenText=true;
  double textHeight=Dimensions.screenHeight/4;
  @override
  void initState() {

   if(widget.text.length>textHeight){
     firstText=widget.text.substring(0,textHeight.toInt());
     secondText=widget.text.substring(textHeight.toInt()+1,widget.text.length);
     print("${Dimensions.screenHeight}");
   }else{ firstText=widget.text;
       secondText='';  print("heloo dear");
   }

   super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondText.isEmpty?Smalltext(text: firstText,):Column(children: [
       Smalltext(text:hiddenText?(firstText + '...'):(firstText+secondText),),
        InkWell(onTap: (){
          setState(() {
            print('hidden triggered');
            hiddenText=!hiddenText;
          });
        },
        child: Row(children: [
          Smalltext(text:hiddenText?'show more':'show less',color: AppColors.mainColor,),
          Icon(hiddenText?Icons.arrow_drop_down_sharp:Icons.arrow_drop_up_outlined, color: AppColors.mainColor,)
        ],),)
      ],),
    );
  }
}
