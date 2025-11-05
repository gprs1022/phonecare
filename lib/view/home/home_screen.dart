import 'package:flutter/material.dart';

import '../platform/platform_helper.dart';
import 'home_mobile.dart';
import 'home_web.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isWeb || PlatformHelper.isDesktop) {
      return const HomeWeb();
    } else if (PlatformHelper.isMobile) {
      return const HomeMobile();
    } else {
      return const Scaffold(
        body: Center(child: Text('Unsupported Platform for Device')),
      );
    }
  }
}
