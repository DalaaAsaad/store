import 'package:get/get.dart';
import 'package:store/ui/shared/shared_widget/utils.dart';

class CartViewController extends GetxController {
  RxInt count = 0.obs;
  RxBool line = false.obs;

  void remove(model) {
    cartService.removeFromCartList(model);
  }

  void increaseQty(model) {
    cartService.changeQty(incress: true, model: model);
  }

  void decreaseQty(model) {
    cartService.changeQty(incress: false, model: model);
  }

  void EmptyCart() {
    cartService.clearCart();
  }
}
