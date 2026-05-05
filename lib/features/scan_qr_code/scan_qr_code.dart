import 'package:dio/dio.dart';
import 'package:medical_device_tracking/model/device.dart';

class ScanQrCode {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 12),
    ),
  )..interceptors.add(
    LogInterceptor(
      requestUrl: true,
      responseBody: true,
      responseHeader: true,
      responseUrl: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      error: true,
    ),
  );

  static Future<int?> getDetailDeviceFromQrCode({
    required String url,
  }) async {
    try {
      final uri = Uri.tryParse(url);
      if (uri == null || !uri.hasAbsolutePath) {
        throw Exception("QR không hợp lệ");
      }

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = DeviceDetailModel.fromJson(response.data);
        return data.id;
      }

      return null;
    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}