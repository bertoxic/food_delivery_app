
import 'package:food_delivery_app/Screens/home/main_food_page.dart';
import 'package:food_delivery_app/Screens/popular_food_page/popular_food_page.dart';
import 'package:food_delivery_app/Screens/recommended_food_details.dart';
import 'package:get/get.dart';

class Routes{

  static String initial='/';
  static String popularFoodPage ='/popularFoodPage';
  static String recommendedFoodPage='/recommendedFoodPage';

  static String getPopularFoodPage(int indexId)=>"$popularFoodPage?indexId=$indexId";
  static String getRecommendedFoodDetails(int indexId)=>'$recommendedFoodPage?indexId=$indexId';


  static List<GetPage> routes=[
    GetPage(name: initial, page: (){ return MainFoodPage();}),

    GetPage(name: popularFoodPage, page:(){
      var indexId=Get.parameters["indexId"];
      return   PopularFoodPage( indexId: int.parse(indexId!,));}),

    GetPage(name: recommendedFoodPage, page:(){
      var indexId=Get.parameters['indexId'];
      return RecommendedFoodDetail(int.parse(indexId!));
    } )

  ];
}