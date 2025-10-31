import 'package:flutter/material.dart';
import 'package:phonecare/view/accessories/accessories_mobile.dart';
import 'package:phonecare/view/accessories/accessories_web.dart';
import 'package:phonecare/view/platform/platform_helper.dart';

class AccessoriesScreen extends StatelessWidget {
  AccessoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isWeb || PlatformHelper.isDesktop) {
      return AccessoriesWeb();
    } else if (PlatformHelper.isMobile) {
      return AccessoriesMobile();
    } else {
      return const Scaffold(
        body: Center(child: Text('Unsupported Platform for Device')),
      );
    }
  }
}
