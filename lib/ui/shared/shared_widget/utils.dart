import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/data/repository/product_repository.dart';
import 'package:store/core/data/repository/shared_preference_repository.dart';
import 'package:store/core/services/cart_services.dart';
import 'package:store/core/services/conectivity_services.dart';

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

SharedPreferenceRepository get storage =>
    Get.find<SharedPreferenceRepository>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
Connectivity get connectivity => Get.find<Connectivity>();
ProductRepository get productRepository => Get.find<ProductRepository>();
CartService get cartService => Get.find<CartService>();
