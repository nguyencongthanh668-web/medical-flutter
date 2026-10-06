import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';

class BaseUrl {
  static String baseUrl = kIsWeb ? 'http://localhost:3000/' : 'http://10.0.2.2:3000/';
}

class EndPoints {
  static const String loginEndPoint = 'api/login';
  static const String getCountDevice = 'api/v1/equipments';
  static const String getListDevice = 'api/v2/equipments';
  static const String getListDepartment = 'api/v1/departments';
  static const String getNotification = 'api/v1/notification';
  static const String getListStaff = 'api/v1/users';
  static const String logoutEndPoint = 'api/v1/logout';
}