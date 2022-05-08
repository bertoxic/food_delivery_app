import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class AppIcons extends StatelessWidget {
   AppIcons({required this.icon,this.backgroundColor=const Color(0x74deddde),this.iconsize=0,
     this.size=10,this.iconColor=const Color(0xff262424)});
  IconData icon;
  double iconsize;
  Color backgroundColor;
   double size=8;
   Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container( padding: EdgeInsets.all(size),
      child: Icon(icon,size: iconsize==0?Dimensions.appIcon:iconsize,color: iconColor,),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: backgroundColor,
      ),
    );
  }
}
