import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../features/common/ui/screens/main_bottom_nab_bar_screen.dart';
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