import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/appColors.dart';
import 'package:food_delivery_app/constants/big_Text.dart';
import 'package:food_delivery_app/constants/small_text.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

import 'food_body_page.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Container(
          child: Container( margin:EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.width15),padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text:'Canada',color: AppColors.mainColor,),
                  Smalltext(text: 'south billard',),
                ],
              ),
                Container( padding: EdgeInsets.all(Dimensions.height10),
                  decoration: (BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius10), color: AppColors.mainColor,)),
                    child: Icon(Icons.search_sharp,color:Colors.white,),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(child: FoodBody())),
      ],
    ));
  }
}
