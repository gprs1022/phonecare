import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/widgets/custom_appbar.dart';
import '../../constant/color.dart';
import '../../view_model/controller/bottomnavbar_controller.dart';
import '../../view_model/controller/darktheme_controller.dart';

class BottomNavbar extends ConsumerWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavProvider);
    final screens = ref.watch(bottomNavProvider.notifier).screen;
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    final size = MediaQuery.of(context).size;
    final width = size.width;

    // 📱💻🖥 Responsive layout (you can use this for spacing, padding, icon sizes, etc.)
    double iconSize;
    double labelFontSize;

    if (width < 600) {
      iconSize = 24;
      labelFontSize = 12;
    } else if (width < 1024) {
      iconSize = 28;
      labelFontSize = 14;
    } else {
      iconSize = 30;
      labelFontSize = 16;
    }

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: const CustomAppbar(),
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: isDarkMode ? Colors.white70 : Colors.black54,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            iconSize: iconSize,
            selectedFontSize: labelFontSize,
            unselectedFontSize: labelFontSize,
            currentIndex: selectedIndex,
            onTap: (index) =>
                ref.read(bottomNavProvider.notifier).onTapIndex(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.phone_android),
                label: 'Refurbished',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.headphones),
                label: 'Accessories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
