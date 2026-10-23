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
}
