import 'package:get/get.dart';

class Dimensions{
// height=912.0
//weight = 430.0
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView=screenHeight/2.85;
  static double  pageViewContainer =screenHeight/4.145;
  static double pageViewTextContainer= screenHeight/7.6;
//height for margin and padding
  static double height10=screenHeight/91.2;
  static double height15=screenHeight/60.8;
  static double height20=screenHeight/45.6;
  static double height30=screenHeight/30.4;
  static double height45=screenHeight/20.26;
  static double height100=screenHeight/9.12;

  // width for padding and margin
  static double width10=screenWidth/43;
  static double width15=screenWidth/28.6;
  static double width20=screenWidth/21.5;
  static double width30=screenWidth/14.3;

  static double font20=screenHeight/45.6;
  static double font26=screenHeight/35.6;

  static double radius10=screenHeight/91.2;
  static double radius20=screenHeight/45.6;
  static double radius30=screenHeight/30.4;
// Listview food category
  static double listViewImageHeight=screenWidth/3.583;

  //PopularFoodImageHeight
  static double popularFoodImageHeight=screenHeight/2.4 ;

  //iconSize
  static double appIcon =screenHeight/45.6;


}