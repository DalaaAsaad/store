import 'package:get/get.dart';
import '../../shared/shared_widget/utils.dart';

class ProductDetailsViewController extends GetxController {
  RxInt qty = 1.obs;

  void addToCart(productModel) {
    cartService.addToCart(model: productModel, qty: qty.value);
  }

  void addToQty() {
    qty += 1;
  }

  void subtractFromQty() {
    if (qty > 1) qty -= 1;
  }
}
