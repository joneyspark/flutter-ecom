import 'package:flut_e_shop/helper/data/api/api_client.dart';
import 'package:flut_e_shop/helper/data/controllers/popular_product_controller.dart';
import 'package:flut_e_shop/helper/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../utils/app_constants.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseURL: AppConstants.BASE_URL));

  // repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
