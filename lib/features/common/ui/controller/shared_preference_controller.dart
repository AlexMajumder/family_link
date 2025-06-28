
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  static SharedPreferencesController get to => Get.find();

  // ============== FIRST LAUNCH LOGIC (NEW ADDITION) ==============
  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_first_launch') ?? true;
  }

  Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_launch', false);
  }

  Future<void> saveUserMail(String mail) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userMail', mail);
  }

  Future<String> getUserMail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userMail') ?? '';
  }

  Future<bool> isLoggedIn() async {
    String mail = await getUserMail();
    return mail.isNotEmpty;
  }






}