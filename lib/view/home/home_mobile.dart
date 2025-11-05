import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:phonecare/widgets/brands_items.dart';
import '../../view_model/controller/darktheme_controller.dart';
import '../../widgets/crausal_slider.dart';

class HomeMobile extends ConsumerWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    final size = MediaQuery.of(context).size;
    final width = size.width;

    // Initialize with default mobile values
    double fontSize = 18.0;
    double containerHeight = 50.0;
    double horizontalMargin = 10.0;

    // Responsive adjustments for mobile
    if (width < 600) {
      // Small mobile
      fontSize = 18;
      containerHeight = 50;
      horizontalMargin = 10;
    } else if (width < 1024) {
      // Large mobile / small tablet
      fontSize = 22;
      containerHeight = 70;
      horizontalMargin = 20;
    } else {
      // Large tablet (still considered mobile context)
      fontSize = 26;
      containerHeight = 90;
      horizontalMargin = 40;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CrausalSlider(),

          //Header Section
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin,
              vertical: 10,
            ),
            alignment: Alignment.center,
            width: double.infinity,
            height: containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).cardColor, // Using theme card color
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).shadowColor.withOpacity(0.1), // Using theme shadow color
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Select Your Brand",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.color, // Using theme text color
                ),
              ),
            ),
          ),

          // Brand Section
          BrandItems(),
        ],
      ),
    );
  }
}
