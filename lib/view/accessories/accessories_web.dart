import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/enums.dart';
import '../../view_model/controller/accessories_provider.dart';
import '../../view_model/controller/darktheme_controller.dart';
import '../../widgets/custom_productcard.dart';

class AccessoriesWeb extends ConsumerStatefulWidget {
  const AccessoriesWeb({super.key});

  @override
  ConsumerState createState() => _AccessoriesWebState();
}

class _AccessoriesWebState extends ConsumerState<AccessoriesWeb> {
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
    final width = MediaQuery.of(context).size.width;
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

    int crossAxisCount;
    double childAspectRatio;

    if (width < 600) {
      // XS
      crossAxisCount = 2;
      childAspectRatio = 0.70;
    } else if (width < 768) {
      // SM
      crossAxisCount = 3;
      childAspectRatio = 0.80;
    } else if (width < 992) {
      // MD
      crossAxisCount = 4;
      childAspectRatio = 0.85;
    } else if (width < 1200) {
      // LG
      crossAxisCount = 5;
      childAspectRatio = 0.90;
    } else if (width < 1600) {
      // XL
      crossAxisCount = 6;
      childAspectRatio = 1.00;
    } else {
      crossAxisCount = 4;
      childAspectRatio = 1.10;
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
          final accessories = productList[index];
          return CustomProductCard(
            productType: Products.accessary,
            accessoryList: accessories,
          );
        },
      ),
    );
  }
}
