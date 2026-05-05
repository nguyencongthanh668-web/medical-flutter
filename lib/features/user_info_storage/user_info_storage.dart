import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_device_tracking/model/user_data.dart';

class UserInfoStorage {
  static Future<void> saveUserInfo({required int id,
    required String displayname,
    required String email,
    required String phone,
    required String birthday,
    required String gender,
    required String profilePhotoUrl,
  }) async {
    final box = Hive.box('authBox');

    await box.put('id', id);
    await box.put('displayname', displayname);
    await box.put('email', email);
    await box.put('phone', phone);
    await box.put('birthday', birthday);
    await box.put('gender', gender);
    await box.put('profilePhotoUrl', profilePhotoUrl);
  }

  static Future<String> getProfilePhotoUrl() async {
    final box = Hive.box('authBox');

    return box.get('profilePhotoUrl');
  }

  static Future<int> getUserId() async {
    final box = Hive.box('authBox');

    return box.get('id');
  }
}