
import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/data/api_client/apiClient.dart';
import 'package:food_delivery_app/utils/appconstants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{
  ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList()async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }

}