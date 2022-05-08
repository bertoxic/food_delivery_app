
import 'package:food_delivery_app/utils/appconstants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token=AppConstants.TOKEN;
  String appBasalUrl;
  late Map<String,String> _mainHeaders;

  ApiClient({required this.appBasalUrl}){
    baseUrl=appBasalUrl;
    timeout=Duration(seconds: 30);
    _mainHeaders={
      'content-type':'application/json; Charset=UTF-8',
      'Authentication':'Bearer $token',
    };
  }

  Future<Response> getData (String url) async {
   try{ Response response= await get(url);
   return response;}catch(e){
     return Response(statusCode: 1,statusText: e.toString());
   }
  }

}