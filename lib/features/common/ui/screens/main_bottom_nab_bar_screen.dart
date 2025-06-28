import 'package:family_link/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_color.dart';
import '../controller/main_bottom_nav_controller.dart';
import '../controller/nab_bar_visibility_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  final NavBarVisibilityController _navBarVisibilityController =
  Get.find<NavBarVisibilityController>();

  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
        builder: (mainBottomNavController) {
          return Scaffold(
            body: SafeArea(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  _navBarVisibilityController.handleScroll(notification);
                  return true;
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), // Slide in from right
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: _screens[mainBottomNavController.selectedIndex],
                ),
              ),
            ),
            bottomNavigationBar:
            GetBuilder<NavBarVisibilityController>(builder: (navBarController) {
              return AnimatedContainer(
                color: Colors.transparent,
                duration: const Duration(milliseconds: 250),
                height: navBarController.isNavBarVisible ? 70 : 0,
                child: navBarController.isNavBarVisible
                    ? Container(
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: .2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: NavigationBar(
                      backgroundColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      selectedIndex: mainBottomNavController.selectedIndex,
                      surfaceTintColor: Colors.transparent,
                      onDestinationSelected: (index) {
                        setState(() {
                          mainBottomNavController.changeIndex(index);
                        });
                      },
                      destinations: [
                        NavigationDestination(
                          icon:  Icon(Icons.home),
                          label: 'Home',
                          selectedIcon: Icon(
                            Icons.home,
                            color: AppColors.themeColor,
                          ),
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.add),
                          label: 'Add',
                          selectedIcon: Icon(
                            Icons.add,
                            color: AppColors.themeColor,
                          ),
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.person),
                          label: 'profile',
                          selectedIcon: Icon(
                            Icons.person,
                            color: AppColors.themeColor,
                          ),
                        ),
                      ],
                    ),
                  )
                    : null,
              );
            }),
          );
        });
  }
}