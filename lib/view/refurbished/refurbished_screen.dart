import 'package:flutter/material.dart';
import 'package:phonecare/view/refurbished/refurbised_mobile.dart';
import 'package:phonecare/view/refurbished/refurbised_web.dart';

import '../platform/platform_helper.dart';

class RefurbishedScreen extends StatelessWidget {
  const RefurbishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isWeb || PlatformHelper.isDesktop) {
      print("web is running 🏃‍♀️🏃  ");
      return RefurbisedWeb();
    } else if (PlatformHelper.isMobile) {
      print("mobile is running 🏃‍♀️🏃  ");
      return RefurbisedMobile();
    } else {
      return const Scaffold(
        body: Center(child: Text('Unsupported Platform for Device')),
      );
    }
  }
}
