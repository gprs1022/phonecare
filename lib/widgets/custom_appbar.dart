import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/constant/color.dart'; // Assuming AppColor.primaryColor is defined here

import '../view_model/controller/darktheme_controller.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final width = MediaQuery.of(context).size.width;

    // Responsive sizing for logo and text
    double logoSize;
    double titleFontSize;
    double actionIconSize;
    double actionContainerSize;
    double actionPadding;
    double actionMarginHorizontal;
    double notificationDotSize;

    if (width < 600) { // Mobile
      logoSize = 40;
      titleFontSize = 20;
      actionIconSize = 20;
      actionContainerSize = 35;
      actionPadding = 4;
      actionMarginHorizontal = 8;
      notificationDotSize = 8;
    } else if (width < 1024) { // Tablet
      logoSize = 45;
      titleFontSize = 22;
      actionIconSize = 22;
      actionContainerSize = 38;
      actionPadding = 4;
      actionMarginHorizontal = 9;
      notificationDotSize = 9;
    } else { // Web/Desktop
      logoSize = 50;
      titleFontSize = 24;
      actionIconSize = 24;
      actionContainerSize = 40;
      actionPadding = 5;
      actionMarginHorizontal = 10;
      notificationDotSize = 10;
    }

    return AppBar(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Theme-aware background
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: logoSize,
                width: logoSize,
              ),
              SizedBox(width: 10),
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: 'Phone', style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleLarge?.color)), // Theme-aware text color
                  TextSpan(text: 'Care', style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold, color: AppColor.primaryColor)), // Use AppColor.primaryColor as it's a constant
                ]
              ))
            ],
          ),
          Spacer(),
          _buildActionIcon(
            Icons.search,
            () {
              context.pushNamed("search");
            },
            actionIconSize, // Pass responsive sizes
            actionContainerSize,
            actionPadding,
            actionMarginHorizontal,
            notificationDotSize,
            AppColor.primaryColor,
          ),
          _buildActionIcon(
            Icons.shopping_cart_rounded,
            () {
              context.pushNamed("cart");
            },
            actionIconSize, // Pass responsive sizes
            actionContainerSize,
            actionPadding,
            actionMarginHorizontal,
            notificationDotSize,
            AppColor.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(
    IconData icon,
    VoidCallback onTap,
    double iconSize,
    double containerSize,
    double padding,
    double marginHorizontal,
    double notificationSize,
    Color primaryColor, // Pass primaryColor from context
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerSize,
        height: containerSize,
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
        decoration: BoxDecoration(
          color: primaryColor, // Use passed primaryColor
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Center(child: Icon(icon, color: Colors.white, size: iconSize)),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: notificationSize,
                height: notificationSize,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(notificationSize / 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
