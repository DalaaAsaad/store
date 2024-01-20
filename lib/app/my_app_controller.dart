import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:store/ui/shared/shared_widget/utils.dart';

class MyAppController extends GetxController {
  @override
  void onInit() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    connectivityService.connectivityStatusController
        .add(connectivityService.getStauts(result));

    super.onInit();
  }
}
