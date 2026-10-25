import 'package:bookia/features/book_details/data/models/books_details_model.dart';
import 'package:dio/dio.dart';

class BookDetailsRepo {
  static Dio dio = Dio();
  static getBooksDetails(int id) async {
    try {
      final response = await dio.get(
        "https://codingarabic.eraapro.com/api/products/$id",
      );
      if (response?.statusCode == 200) {
        BooksDetailsModel book = BooksDetailsModel.fromJson(response?.data);
        return book;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
