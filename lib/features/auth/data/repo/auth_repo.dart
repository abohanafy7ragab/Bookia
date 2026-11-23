import 'package:bookia/core/networking/api_result.dart';
import 'package:bookia/core/networking/dio_exeption_handler.dart';
import 'package:bookia/core/services/local_helper/local_helper.dart';
import 'package:bookia/core/utils/app_contants.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();

  static Future<ApiResult> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/api/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        String? token = response.data["data"]["token"];
        saveToken(token);
        return Success("data");
      } else {
        return Error("message");
      }
    } catch (e) {
      return Error(DioExceptionHandler.handle(e));
    }
  }

  static void saveToken(String? token) async {
    // print(token);
    await LocalHelper.prefs?.setString(AppContants.token, token ?? "");
  }

  static  Future<ApiResult> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/api/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      if (response.statusCode == 201) {
        String? token = response.data["data"]["token"];
        saveToken(token);
        return Success("data");
      } else {
        return Error("message");
      }
    } catch (e) {
      return Error("message");
    }
  }
}
