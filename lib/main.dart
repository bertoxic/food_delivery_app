import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/home/main_food_page.dart';
import 'package:food_delivery_app/Screens/popular_food_page/popular_food_page.dart';
import 'package:food_delivery_app/Screens/recommended_food_details.dart';
import 'package:food_delivery_app/helper/controller/CartController.dart';
import 'package:food_delivery_app/helper/controller/popular_product_controller.dart';
import 'package:food_delivery_app/helper/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/routes_navigator/routes.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart'as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getProductList();
    Get.find<RecommendedProductController>().getRecommendedList();
    Get.find<CartController>();
    return GetMaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    // home: MainFoodPage(),
      initialRoute: Routes.initial,
      getPages: Routes.routes,
    );
  }
}
