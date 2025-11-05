import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/models/refurbished_model.dart';
import 'package:phonecare/view/auth/login_screen.dart';
import 'package:phonecare/view/bottomnavbar/bottom_navbar.dart';
import 'package:phonecare/view/cart/cart_screen.dart';
import 'package:phonecare/view/platform/platform_helper.dart';
import 'package:phonecare/widgets/brand_details.dart';
import 'package:phonecare/widgets/order_screen.dart';
import 'package:phonecare/widgets/search_screen.dart';

import '../constant/enums.dart';
import '../models/accessories_model.dart';
import '../view/auth/verifyOtp_screen.dart';
import '../view/home/home_screen.dart';
import '../view/splash/onboarding_screen.dart';
import '../view/splash/splash_screen.dart';
import '../widgets/address_screen.dart';
import '../widgets/product_details.dart';
import '../widgets/product_service.dart';

final GoRouter router = GoRouter(
  initialLocation: PlatformHelper.isWeb ? '/login' : '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/verifyOtp',
      name: 'verifyOtp',
      builder: (context, state) => VerifyOtpScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/bottomNav',
      name: 'bottomNav',
      builder: (context, state) => BottomNavbar(),
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => CartScreen(),
    ),
    GoRoute(
      path: "/search",
      name: "search",
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: "/orders",
      name: "orders",
      builder: (context, state) => OrderScreen(),
    ),
    GoRoute(
      path: '/address',
      name: 'address',
      builder: (context, state) => AddressScreen(),
    ),
    GoRoute(
      path: '/productdetails',
      name: 'productdetails',
      builder: (context, state) {
        final data = state.extra;
        if (data is AccessoriesModel) {
          return ProductDetails(
            productType: Products.accessary,
            accessoriesList: data,
          );
        } else if (data is RefurbishedModel) {
          return ProductDetails(
            productType: Products.refurbrished,
            refurbishedList: data,
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("Invalid product type")),
          );
        }
      },
    ),

    GoRoute(
      name: "branddetails",
      path: "/branddetails",
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        final brandName = data['name'] ?? 'No Name';
        return BrandDetails(brandName: brandName);
      },
    ),
    GoRoute(
      path: "/productService",
      name: "productService",
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        final name = data['name'] ?? 'No Name';
        final image = data['image'] ?? 'No Image';
        return ProductService(name: name, modelImage: image);
      },
    ),
  ],
);
