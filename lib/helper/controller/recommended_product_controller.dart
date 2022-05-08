
import 'package:food_delivery_app/helper/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController{
  RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _RecommendedList=[];
  List<dynamic> get RecommendedList =>_RecommendedList;
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  Future<void>getRecommendedList()async{
    Response response=await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      _isLoaded=true;
      _RecommendedList=[];
      _RecommendedList.addAll(Products.fromJson(response.body).products);
      update();
    }else{ print('recommendedcontoller response is not 200');}
  }

}