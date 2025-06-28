import 'package:flutter/material.dart';
import '../../../../app/assets_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key, this.width, this.height, this.boxFit,
  });

  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPath.appLogo,
      width: width ?? 120,
      height: height ?? 120,
      fit: boxFit ?? BoxFit.scaleDown,
    );
  }
}