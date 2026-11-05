import 'package:dio/dio.dart';

class CartRepo {
  static Dio dio = Dio();

  static Future<bool> addToCart(int productId) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/api/add-to-cart",
        data: {"product_id": productId},
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
