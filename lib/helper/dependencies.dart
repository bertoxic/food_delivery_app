
import 'package:food_delivery_app/helper/controller/CartController.dart';
import 'package:food_delivery_app/helper/controller/popular_product_controller.dart';
import 'package:food_delivery_app/helper/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/helper/data/api_client/apiClient.dart';
import 'package:food_delivery_app/helper/repository/cart_repo.dart';
import 'package:food_delivery_app/helper/repository/popular_product_repo.dart';
import 'package:food_delivery_app/helper/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/utils/appconstants.dart';
import 'package:get/get.dart';

Future<void> init()async{
    //Apiclient
  Get.lazyPut(()=>ApiClient(appBasalUrl: AppConstants.BASEURL));
  //repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //Controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo: Get.find()));
 //CartController
  Get.lazyPut(()=>CartController(cartRepo: Get.find()));


}