import 'package:get/get.dart';
import 'package:store/core/data/models/cart_model.dart';
import 'package:store/core/data/models/product_model.dart';
import 'package:store/ui/shared/shared_widget/utils.dart';

class CartService {
  RxList<CartModel> cartList = storage.getCartList().obs;

  RxInt cartCount = 0.obs;

  RxDouble subTotal = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble deliveryFees = 0.0.obs;
  RxDouble total = 0.0.obs;

  double taxPercent = 0.18;
  double deliveryPercent = 0.10;

  CartService() {
    calcCartCount();
    calcTotals();
  }

  void addToCart({required ProductModel model, required int qty}) {
    if (getCartModel(model) != null) {
      int index = cartList
          .indexWhere((element) => element.productModel!.id == model.id);
      cartList[index].qty = cartList[index].qty! + qty;
      cartList[index].total =
          cartList[index].total! + calaProductTotal(qty, model);
    } else {
      cartList.add(CartModel(
          productModel: model, qty: qty, total: calaProductTotal(qty, model)));
    }

    storage.setCartList(cartList);
    cartCount.value += qty;
    calcTotals();
  }

  void removeFromCartList(CartModel model) {
    cartList.remove(model);

    storage.setCartList(cartList);
    cartCount.value -= model.qty ?? 0;
    calcTotals();
  }

  void changeQty({
    required CartModel model,
    required bool incress,
  }) {
    CartModel? result = getCartModel(model.productModel!);

    if (result == null) {
      addToCart(model: model.productModel!, qty: 1);
      return;
    }

    int index = cartList.indexWhere(
        (element) => element.productModel!.id == model.productModel!.id);

    if (incress) {
      result.total = result.total! + model.productModel!.price!;
      result.qty = result.qty! + 1;
      cartCount.value += 1;
    } else {
      if (result.qty == 1) return;
      result.total = result.total! - model.productModel!.price!;
      result.qty = result.qty! - 1;
      if (cartCount.value > 0) cartCount.value -= 1;
    }

    cartList.removeAt(index);
    cartList.insert(index, result);

    storage.setCartList(cartList);
    calcTotals();
  }

  double calaProductTotal(int qty, ProductModel model) {
    return qty * model.price!;
  }

  void clearCart() {
    cartList.clear();
    storage.setCartList(cartList);
    cartCount.value = 0;
    calcTotals();
  }

  CartModel? getCartModel(ProductModel model) {
    try {
      return cartList.firstWhere(
        (element) => element.productModel!.id == model.id,
      );
    } catch (e) {
      return null;
    }
  }

  void calcCartCount() {
    cartCount.value = cartList.fold(
        0, (previousValue, element) => previousValue + (element.qty ?? 0));
  }

  void calcTotals() {
    subTotal.value = cartList.fold(
        0, (previousValue, element) => previousValue + (element.total ?? 0));
    taxAmount.value = subTotal.value * taxPercent;
    deliveryFees.value = subTotal.value * deliveryPercent;
    total.value = subTotal.value + taxAmount.value + deliveryFees.value;
  }
}
