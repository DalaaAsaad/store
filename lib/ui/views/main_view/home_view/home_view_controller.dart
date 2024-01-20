import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/product_model.dart';
import '../../../shared/shared_widget/utils.dart';

class HomeViewController extends GetxController {
  RxString selectedCategories = "All".obs;
  RxList<String> Categoreis = ["All"].obs;
  RxList<ProductModel> Products = <ProductModel>[].obs;
  RxInt current = 0.obs;
  RxInt action = 0.obs;
  RxBool apiFinised = false.obs;
  @override
  void onInit() {
    getAllcategories();
    getAllProducts(selectedCategories.value);
    super.onInit();
  }

  void getAllcategories() async {
    await productRepository.getAllCategory().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        Categoreis.addAll(r);
      });
    });
  }

  void getAllProducts(String categorey) async {
    Products.clear();
    if (categorey == 'All') {
      await productRepository.getAllProduct(categoryType: 'products/').then(
          (value) => value.fold(
              (l) => BotToast.showText(text: l), (r) => Products.addAll(r)));
    } else {
      await productRepository
          .getAllProduct(categoryType: 'products/category/${categorey}')
          .then((value) => value.fold(
              (l) => BotToast.showText(text: l), (r) => Products.addAll(r)));
    }

    apiFinised.value = true;
  }
}
