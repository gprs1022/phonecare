import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/view_model/controller/login_provider.dart';

import '../../view_model/controller/darktheme_controller.dart';

class ProfileMobile extends ConsumerWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    "https://img.icons8.com/color/200/avatar.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Pradeep Singh",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "demo@gmail.com",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 80),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Options",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            child: Column(
              children: [
                _buildActionIcon("Your Orders", Icons.shopping_bag, () {
                  context.pushNamed("orders");
                }),
                _darkMode("Dark Mode", Icons.dark_mode),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Settings",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            child: Column(
              children: [
                _buildActionIcon("Add Adddress", Icons.location_on_sharp, () {
                  context.pushNamed("address");
                }),

                _buildActionIcon("About Us", Icons.info_outline, () {}),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Support",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            child: Column(
              children: [
                _buildActionIcon("Privacy Policy", Icons.privacy_tip, () {}),
                _buildActionIcon("Help & Support", Icons.help_outline, () {}),
                _buildActionIcon("Contact Us", Icons.phone, () {}),
                _buildActionIcon("Logout", Icons.logout, () {
                  //logout function calling
                  ref.read(loginTypeProvider.notifier).logout();
                  context.pushNamed("login");
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(text, IconData icon, VoidCallback onTap) {
    return Consumer(
      builder: (context, ref, _) {
        final themeMode = ref.watch(darkthemeProvider);
        final isDarkMode = themeMode == ThemeMode.dark;
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
                SizedBox(width: 20),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _darkMode(text, IconData icon) {
    return Consumer(
      builder: (context, ref, _) {
        final themeMode = ref.watch(darkthemeProvider);
        final isDarkMode = themeMode == ThemeMode.dark;
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
              SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Spacer(),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  ref.read(darkthemeProvider.notifier).toggleTheme();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
