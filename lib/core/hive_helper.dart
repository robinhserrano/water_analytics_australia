import 'package:hive/hive.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';

class HiveHelper {
  static Future<Box<UserHive>?> openUserBox() async {
    try {
      final box = await Hive.openBox<UserHive>('user');
      return box;
    } catch (e) {
      print('Error opening user box: $e');
      return null;
    }
  }

  static Future<bool> isUserBoxExists() async {
    try {
      final box = await Hive.openBox<UserHive>('user');
      return box != null;
    } catch (e) {
      print('Error checking user box: $e');
      return false;
    }
  }
}
