import 'package:get/get.dart';
import '../features/common/ui/controller/main_bottom_nav_controller.dart';
import '../features/common/ui/controller/nab_bar_visibility_controller.dart';
import '../features/common/ui/controller/shared_preference_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NavBarVisibilityController());
    Get.put(SharedPreferencesController());
  }
}
