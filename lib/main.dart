import 'package:flut_e_shop/helper/data/controllers/popular_product_controller.dart';
import 'package:flut_e_shop/pages/food/popular_food_detail.dart';
import 'package:flut_e_shop/pages/food/recommended_food_detail.dart';
import 'package:flut_e_shop/pages/home/food_page_body.dart';
import 'package:flut_e_shop/pages/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flut_e_shop/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
    );
  }
}
