import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/app/my_app.dart';
import 'package:store/core/data/repository/product_repository.dart';
import 'package:store/core/data/repository/shared_preference_repository.dart';
import 'package:store/core/services/cart_services.dart';
import 'package:store/core/services/conectivity_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => SharedPreferenceRepository());
  await Get.putAsync(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Get.put(ConnectivityService());
  Get.put(Connectivity());
  Get.put(ProductRepository());
  Get.lazyPut(() => CartService());
  runApp(MyApp());
}
