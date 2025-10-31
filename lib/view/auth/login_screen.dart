import 'package:flutter/material.dart';

import '../platform/platform_helper.dart';
import 'login_mobile.dart';
import 'login_web.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if(PlatformHelper.isWeb || PlatformHelper.isDesktop){
      print("web is running 🏃‍♀️");
      return LoginWeb();
    } else {
      print("mobile is running 🏃‍♀️");
      return LoginMobile();
    }
  }
}
