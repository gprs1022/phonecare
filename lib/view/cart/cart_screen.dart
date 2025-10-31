import 'package:flutter/material.dart';

import '../platform/platform_helper.dart';
import 'cart_mobile.dart';
import 'cart_web.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (PlatformHelper.isWeb || PlatformHelper.isDesktop && width >= 1024)  {
      print("web is running 🏃‍♀️");
      return CartWeb();
    }  else {
      print("mobile is running 🏃‍♀️");
      return CartMobile();
    }
  }
}
