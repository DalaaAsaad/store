import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/product_model.dart';
import '../../../shared/shared_widget/utils.dart';

class AllProductViewController extends GetxController {
  RxList<ProductModel> listAllProduct = <ProductModel>[].obs;
  RxList<ProductModel> foundProducts = <ProductModel>[].obs;
  RxInt action = 0.obs;
  @override
  void onInit() {
    getAllcategory();
    foundProducts.value = listAllProduct;
    super.onInit();
  }

  void getAllcategory() async {
    await productRepository
        .getAllProduct(categoryType: 'products/')
        .then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        listAllProduct.addAll(r);
      });
    });
  }

  void runFilter(String enterKeyword) {
    List<ProductModel> result = [];
    if (enterKeyword.isEmpty) {
      result = listAllProduct;
    } else {
      result = listAllProduct
          .where((element) =>
              element.title!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }

    foundProducts.value = result;
  }
}
