import 'package:medical_device_tracking/di/di.dart';
import 'package:medical_device_tracking/network/dio_config/dio_config.dart';
import 'package:medical_device_tracking/network/url/app_url.dart';

class Logout {
  static Future<String> logout() async {
    final logoutEndPoint = EndPoints.logoutEndPoint;
    final dio = getIt<DioConfig>().dio;

    final response = await dio.post(logoutEndPoint);

    if (response.statusCode == 200) {
      return 'Logout Success';
    }

    else {
      return 'Logout Failure';
    }
  }
}