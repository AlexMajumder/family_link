import 'package:family_link/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../app/app_color.dart';
import '../../../../app/assets_path.dart';
import '../../../common/ui/controller/shared_preference_controller.dart';
import '../../../common/ui/screens/main_bottom_nab_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _endTheSplashScreen();
    super.initState();
  }

  Future<void> _endTheSplashScreen() async {
    bool isLoggedIn = await SharedPreferencesController.to.isLoggedIn();
    await Future.delayed(const Duration(seconds: 3));
    isLoggedIn
        ? Get.offNamed(MainBottomNavScreen.name)
        : Get.offNamed(LogInScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'Family Link',
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 41,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(128, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Lottie.asset(AssetsPath.splashJson),
                const Spacer(),
                Center(
                  child: Container(width: 80, child: LinearProgressIndicator()),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Version 0.0.1',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'A Digital Product of Wallet Hunter',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
