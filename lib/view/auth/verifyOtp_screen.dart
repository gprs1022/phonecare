import 'package:flutter/material.dart';
import 'package:phonecare/view/auth/verifyOtp_mobile.dart';
import 'package:phonecare/view/auth/verifyOtp_web.dart';

import '../platform/platform_helper.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isWeb || PlatformHelper.isDesktop) {
      print("web is running 🏃‍♀️");
      return VerifyOtpWeb();
    } else {
      print("mobile is running 🏃‍♀️");
      return VerifyOtpMobile();
    }
  }
}
