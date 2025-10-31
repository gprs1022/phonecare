import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/view_model/controller/home_provider.dart';
import 'package:phonecare/view_model/service/api_config.dart';
import '../view_model/controller/darktheme_controller.dart';

class BrandItems extends ConsumerStatefulWidget {
  const BrandItems({super.key});

  @override
  ConsumerState createState() => _BrandItemsState();
}

class _BrandItemsState extends ConsumerState<BrandItems> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifierProvider.notifier).getBrands();
    });
  }


  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final homeNotifier = ref.watch(homeNotifierProvider.notifier);
    final apiStatus = ref.watch(homeNotifierProvider);
    final brands = homeNotifier.brands;



    // Get screen width

    final width = MediaQuery
        .of(context)
        .size
        .width;

    int crossAxisCount;
    double imageSize;
    double fontSize;

    if (width < 600) { // XS: Small mobile
      crossAxisCount = 2;
      imageSize = 70; // Smaller image for small screens
      fontSize = 12;
    } else if (width < 768) { // SM: Large mobile / small tablet
      crossAxisCount = 3;
      imageSize = 80;
      fontSize = 14;
    } else if (width < 992) { // MD: Tablet portrait / small laptop
      crossAxisCount = 4;
      imageSize = 90;
      fontSize = 16;
    } else if (width < 1200) { // LG: Tablet landscape / medium laptop
      crossAxisCount = 5;
      imageSize = 100;
      fontSize = 16;
    } else if (width < 1600) { // XL: Large laptop / desktop
      crossAxisCount = 6;
      imageSize = 110;
      fontSize = 18;
    } else { // XXL: Large desktop / monitor
      crossAxisCount = 7;
      imageSize = 120;
      fontSize = 18;
    }

    if (apiStatus == ApiStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (apiStatus == ApiStatus.error) {
      return const Center(child: Text("Failed to load brands "));
    } else if (brands.isEmpty) {
      return const Center(child: Text("No brands available"));
    }


    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: brands.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // Keep 1:1 aspect ratio for brand cards
          ),
          itemBuilder: (context, index) {
            // storing brand name in a variable
            final brand = brands[index];
            return GestureDetector(
              onTap: () {
                ref.read(homeNotifierProvider.notifier).getPhoneByBrandId(brand.id);
                context.pushNamed(
                  "branddetails",
                  extra: {
                    'name': brand.name,
                  },
                );
              },
              child: Card(
                elevation: 6,
                color: Theme
                    .of(context)
                    .cardColor, // Using theme card color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox( // Use SizedBox for controlled image size
                      width: imageSize,
                      height: imageSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          brand.logo.startsWith('http')
                          ? brand.logo
                          : "${ApiConfig.baseUrl}/${brand.logo}",
                          fit: BoxFit.contain, // Ensure full logo is visible
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      brand.name,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.color, // Using theme text color
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}