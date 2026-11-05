import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/profile/data/models/profile_response.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  static var dio = Dio();

   static Future<ProfileResponse?> profileData() async {
    try {
      final response = await DioFactory.dio?.get(
        "/profile",
      );
      if (response?.statusCode == 200) {
        return ProfileResponse.fromJson(response?.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
    
  }
}
