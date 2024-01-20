import 'dart:convert';
import 'package:store/core/data/models/product_model.dart';

class CartModel {
  ProductModel? productModel;
  int? qty = 0;
  double? total;

  CartModel({this.productModel, this.qty, this.total});

  CartModel.fromJson(Map<String, dynamic> json) {
    productModel = json['product_model'] != null
        ? new ProductModel.fromJson(json['product_model'])
        : null;
    qty = json['qty'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productModel != null) {
      data['product_model'] = this.productModel!.toJson();
    }
    data['qty'] = this.qty;
    data['total'] = this.total;
    return data;
  }

  static Map<String, dynamic> toMap(CartModel model) => {
        'product_model': model.productModel,
        'qty': model.qty,
        'total': model.total,
      };

  static String encode(List<CartModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((model) => CartModel.toMap(model))
            .toList(),
      );

  static List<CartModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
