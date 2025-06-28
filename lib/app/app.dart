import 'package:family_link/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../features/auth/ui/screens/otp_verification_screen.dart';
import '../features/common/ui/screens/main_bottom_nab_bar_screen.dart';
import '../features/registration/ui/screens/head_registration_screen.dart';
import '../features/splash/ui/screens/splash_screen.dart';
import 'app_theme_data.dart';
import 'controller_binder.dart';


class FamilyLinkApp extends StatefulWidget {
  const FamilyLinkApp({super.key});

  @override
  State<FamilyLinkApp> createState() => _FamilyLinkAppState();
}

class _FamilyLinkAppState extends State<FamilyLinkApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialBinding: ControllerBinder(),
      theme: AppThemeData.lightThemeData,
      //darkTheme: AppThemeData.darkThemeData,
      initialRoute: SplashScreen.name,
      onGenerateRoute: (RouteSettings setting) {
        late Widget widget;
        if (setting.name == SplashScreen.name) {
          widget = const SplashScreen();
        }else if (setting.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        }else if (setting.name == LogInScreen.name) {
          widget = const LogInScreen();
        }else if (setting.name == HeadRegistrationScreen.name) {
          widget = const HeadRegistrationScreen();
        }else if (setting.name == OtpVerificationScreen.name) {
          String email = setting.arguments as String;
          widget = OtpVerificationScreen(
            email: email,
          );
        }
        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
    );
  }
}