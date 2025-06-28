import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class NavBarVisibilityController extends GetxController {
  bool _isNavBarVisible = true;
  Timer? _idleTimer;

  bool get isNavBarVisible => _isNavBarVisible;

  void handleScroll(UserScrollNotification notification) {
    _resetIdleTimer();

    if (notification.direction == ScrollDirection.reverse) {
      if (_isNavBarVisible) {
        _isNavBarVisible = false;
        update();
      }
    } else if (notification.direction == ScrollDirection.forward) {
      if (!_isNavBarVisible) {
        _isNavBarVisible = true;
        update();
      }
    }
  }

  void _resetIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(const Duration(seconds: 2), () {
      if (!_isNavBarVisible) {
        _isNavBarVisible = true;
        update();
      }
    });
  }

  void showNavBar() {
    _idleTimer?.cancel();
    if (!_isNavBarVisible) {
      _isNavBarVisible = true;
      update();
    }
  }

  void hideNavBar() {
    _idleTimer?.cancel();
    if (_isNavBarVisible) {
      _isNavBarVisible = false;
      update();
    }
  }

  @override
  void onClose() {
    _idleTimer?.cancel();
    super.onClose();
  }
}