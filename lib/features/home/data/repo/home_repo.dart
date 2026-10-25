import 'package:bookia/features/home/data/models/Books_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static Dio dio = Dio();

  static getBestSellerBooks() async {
    try {
      final response = await dio.get(
        "https://codingarabic.eraapro.com/api/products-bestseller",
      );
      if (response.statusCode == 200) {
        BooksModel books = BooksModel.fromJson(response.data);
        return books;
      }
    } catch (e) {

    }
  }
  

  static Dio dio2 = Dio();
  static Future<List<Products?>?> search(String text) async {
    try {
      final response = await dio2?.get(
        "https://codingarabic.eraapro.com/api/products-search",
        queryParameters: {"name": text},
      );
      print(response?.statusCode);
      if (response?.statusCode == 200) {
        BooksModel book = BooksModel.fromJson(response?.data);
        return book.data?.products;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
