import 'package:bookia/core/services/local_helper/local_helper.dart';
import 'package:bookia/core/utils/app_contants.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final respnse = await dio.post(
        "https://codingarabic.eraapro.com/api/login",
        data: {"email": email, "password": password},
      );
      if (respnse.statusCode == 200) {
        String? token = respnse.data["data"]["token"];
        saveToken(token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static void saveToken(String? token) async {
    // print(token);
    await LocalHelper.prefs?.setString(AppContants.token, token ?? "");
  }
}
