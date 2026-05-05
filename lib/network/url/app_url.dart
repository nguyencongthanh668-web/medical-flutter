import 'package:hive_flutter/hive_flutter.dart';

class BaseUrl {
  static String baseUrl = Hive.box('urlBox').get('baseUrl');
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