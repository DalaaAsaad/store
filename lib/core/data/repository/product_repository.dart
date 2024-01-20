import 'package:dartz/dartz.dart';
import 'package:store/core/data/models/commun_response.dart';
import 'package:store/core/data/models/product_model.dart';
import 'package:store/core/enums/request_type.dart';
import 'package:store/core/utils/network_util.dart';

class ProductRepository {
  Future<Either<String, List<ProductModel>>> getAllProduct(
      {required String? categoryType}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: '${categoryType}',
      ).then((value) {
        CommunResponse<List<dynamic>> commonResponse =
            CommunResponse.fromjson(value);

        if (commonResponse.getstatuscode) {
          List<ProductModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(ProductModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getAllCategory() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'products/categories',
      ).then((value) {
        CommunResponse<List<dynamic>> commonResponse =
            CommunResponse.fromjson(value);

        if (commonResponse.getstatuscode) {
          List<String> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(element.toString());
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
