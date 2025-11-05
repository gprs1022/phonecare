import 'package:flutter/material.dart';
import 'package:phonecare/view/profile/profile_mobile.dart';
import 'package:phonecare/view/profile/profile_web.dart';

import '../platform/platform_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isWeb || PlatformHelper.isDesktop) {
      print("web is running 🏃‍♀️🏃  ");
      return const ProfileWeb();
    } else if (PlatformHelper.isMobile) {
      print("mobile is running 🏃‍♀️🏃  ");
      return const ProfileMobile();
    } else {
      return const Scaffold(
        body: Center(child: Text('Unsupported Platform for Device')),
      );
    }
  }
}
