import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/core/data/models/cart_model.dart';
import 'package:store/core/enums/data_type.dart';

class SharedPreferenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();
  String PREF_APP_LANG = 'app_language';
  String PREF_CART_LIST = 'cart_list';

  void setAppLnaguage(String code) {
    setPrefrnce(type: DataType.STRING, key: PREF_APP_LANG, value: code);
  }

  String getAppLanguge() {
    if (pref.containsKey(PREF_APP_LANG)) {
      return getPrefrnce(PREF_APP_LANG);
    } else {
      return 'en';
    }
  }

  void setCartList(List<CartModel> list) {
    setPrefrnce(
        type: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (pref.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPrefrnce(PREF_CART_LIST));
    } else {
      return [];
    }
  }

  setPrefrnce({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrnce(String key) {
    return pref.get(key);
  }
}
