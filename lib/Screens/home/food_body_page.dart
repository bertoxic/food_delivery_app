import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/popular_food_page/popular_food_page.dart';
import 'package:food_delivery_app/constants/appColors.dart';
import 'package:food_delivery_app/constants/app_Column.dart';
import 'package:food_delivery_app/constants/big_Text.dart';
import 'package:food_delivery_app/constants/icon_and_text_widget.dart';
import 'package:food_delivery_app/helper/controller/popular_product_controller.dart';
import 'package:food_delivery_app/constants/small_text.dart';
import 'package:food_delivery_app/helper/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/utils/appconstants.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../routes_navigator/routes.dart';

class FoodBody extends StatefulWidget {
  const FoodBody({Key? key}) : super(key: key);

  @override
  State<FoodBody> createState() => _FoodBodyState();
}
PageController pageController=PageController(viewportFraction: 0.85);



class _FoodBodyState extends State<FoodBody> {
  var _currentPage=0.0;
  double _scalefactor=0.8;
  double _height=Dimensions.pageViewTextContainer;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentPage=pageController.page!;
       // print(_currentPage);
      });
    });
    super.initState();
  }
  @override
  void dispose() {

    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       GetBuilder<PopularProductController>(builder: (popularProducts){
         return popularProducts.isLoaded? Container( height:Dimensions.pageView,
           child: PageView.builder( itemCount: popularProducts.popularProductList.length  , controller: pageController,
               itemBuilder: (context, index) {
                 return _buildPage(index, popularProducts.popularProductList[index]);
               }),):CircularProgressIndicator(color: AppColors.mainColor,);
       }),
     GetBuilder<PopularProductController>(builder: (popularProduct){
       return DotsIndicator(
         dotsCount: popularProduct.popularProductList.isEmpty?3:popularProduct.popularProductList.length,
         position: _currentPage,
         decorator: DotsDecorator(
           size: const Size.square(9.0),
           activeSize: const Size(18.0, 9.0),
           activeColor: AppColors.mainColor,
           activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
         ),
       );
     }),
        SizedBox(height: Dimensions.height30,),
        //popular items
        Container( margin: EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width15),
          child: Column(
            children: [
              Row( crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BigText(text:'Recommended'),
                  SizedBox(width: Dimensions.width10,),
                  Container( padding: EdgeInsets.only(bottom: Dimensions.height10/2),
                    child: BigText(text: '.',),
                  ),SizedBox(width: Dimensions.width10,),
                  Container(
                    child: Smalltext(text: 'Food pairing',),
                  )
                ],
              ),
              GetBuilder<RecommendedProductController>(
                builder: ( RecommendedProduct) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:RecommendedProduct.RecommendedList.length,itemBuilder: (context, index) {
                    return RecommendedProduct.isLoaded?GestureDetector( onTap: (){Get.toNamed(Routes.getRecommendedFoodDetails(index));},
                      child: Container( margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Row(
                          children: [
                            Container( width:120,height: 120,
                              decoration: BoxDecoration(
                                  color:Colors.blue,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),bottomLeft: Radius.circular(Dimensions.radius20)),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/food  (${index}).jpg'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewImageHeight,
                                decoration: BoxDecoration( color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(Dimensions.radius20),
                                      topRight:Radius.circular(Dimensions.radius20),)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(left:Dimensions.height10,top:Dimensions.height10,right: Dimensions.height15 ),
                                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text:RecommendedProduct.RecommendedList[index].name,overflow: TextOverflow.ellipsis,size: 18,color: Colors.grey.shade800,),
                                      Smalltext(text: 'With japanese cook meal secrets',),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconandText(icon: Icons.circle,text: 'Normal',iconcolor:AppColors.yellowColor,),
                                          IconandText(icon: Icons.location_on,text: 'location',iconcolor:AppColors.mainColor,),
                                          IconandText(icon: Icons.timelapse_rounded,text: 'delivery time',)
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ):Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
                      });
                },

              )
            ],
          ),
        ),
        //List of items

      ],
    );
  }
  Widget _buildPage(int index, ProductModel popularProduct,){

    Matrix4 matrix =Matrix4.identity();
    if(index==_currentPage.floor()){
      var currScale=1 - (_currentPage-index)*(1-_scalefactor);
      var currTrans= _height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currentPage.floor()+1){
      var currScale= _scalefactor + ((_currentPage-index + 1)*(1 - _scalefactor));
      var currTrans= _height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }else if(index<_currentPage.floor()-1){
      var currScale= _scalefactor + ((_currentPage-index - 1)*(1 - _scalefactor));
      var currTrans= _height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix= Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scalefactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector( onTap: (){Get.toNamed(Routes.getPopularFoodPage(index));},
            child: Container( margin: EdgeInsets.only(left: Dimensions.width15,right: Dimensions.height15),
              height: Dimensions.pageViewContainer,
              decoration: (BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage( fit: BoxFit.cover,
                    image:AssetImage('assets/images/food  (${index+6}).jpg')
                    //NetworkImage(AppConstants.BASEURL+'/uploads/'+ popularProduct.img!)
                ),

                // color:index.isEven?Color(0xff375987):Color(0xffdcdcdc),
              )),
            ),
          ),
          Align(alignment: Alignment.bottomCenter,
            child: Container( margin: EdgeInsets.only(left: 32,right: 32,bottom: Dimensions.height20),
              height: Dimensions.pageViewTextContainer,
              decoration: (BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color:Color(0xffeae9e9),
                boxShadow: [
                  BoxShadow(color: Color(0xffcecece), offset: Offset(0,5),blurRadius:5,),
                  BoxShadow(color: Colors.white, offset: Offset(-5,0),blurRadius:5),
                  BoxShadow(color: Colors.white, offset: Offset(5,0),blurRadius:5)
                ]
              )),
              child: Container(
                padding: EdgeInsets.only(top: 0,left:Dimensions.width15,right: Dimensions.width15,bottom: 0),
                child: AppColumn(text: popularProduct.name!,),
              ),
            ),
          )
        ],
      ),
    );
  }

}
