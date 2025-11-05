import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/view_model/controller/accessories_provider.dart';

import '../../constant/enums.dart';
import '../../view_model/controller/darktheme_controller.dart';
import '../../widgets/custom_productcard.dart';

class AccessoriesMobile extends ConsumerStatefulWidget {
  const AccessoriesMobile({super.key});

  @override
  ConsumerState createState() => _AccessoriesMobileState();
}

class _AccessoriesMobileState extends ConsumerState<AccessoriesMobile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(accessoriesNotifier.notifier).getAccessories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final accessoriesNotifierInstance = ref.read(accessoriesNotifier.notifier);
    final apiStatus = ref.watch(accessoriesNotifier);
    final productList = accessoriesNotifierInstance.accessoriesList;

    if (apiStatus == ApiStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (apiStatus == ApiStatus.error) {
      return const Center(child: Text("Something went wrong"));
    } else if (productList.isEmpty) {
      return const Center(child: Text("No data found"));
    }

    final width = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double childAspectRatio;

    if (width < 600) {
      // XS: Small mobile
      crossAxisCount = 2;
      childAspectRatio = 0.70;
    } else if (width < 768) {
      // SM: Large mobile / small tablet
      crossAxisCount = 3;
      childAspectRatio = 0.80;
    } else {
      // MD and up for mobile context
      crossAxisCount = 4;
      childAspectRatio = 0.85;
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: productList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          final item = productList[index];
          return CustomProductCard(
            productType: Products.accessary,
            accessoryList: item,
          );
        },
      ),
    );
  }
}
