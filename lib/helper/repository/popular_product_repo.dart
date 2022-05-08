import 'package:food_delivery_app/utils/appconstants.dart';
import 'package:get/get.dart';
import '../data/api_client/apiClient.dart';

class PopularProductRepo extends GetxService{
  ApiClient apiClient;
  PopularProductRepo({required this.apiClient});


  Future<Response> getpopularProductList()async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }

}