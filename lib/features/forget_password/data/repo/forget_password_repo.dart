import 'package:bookia/core/networking/api_result.dart';
import 'package:dio/dio.dart';

class ForgetPasswordRepo {
  static Dio dio = Dio();

  static Future<ApiResult> sendEmail({required String email}) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/api/forget-password",
        data: {"email": email},
      );
      if (response.statusCode == 500) {
        return Success("data");
      } else {
        return Error("message");
      }
    } catch (e) {
      return Error("message");
    }
  }
}
