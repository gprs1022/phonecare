import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/view_model/controller/home_provider.dart';
import 'package:phonecare/view_model/service/api_config.dart';
import '../constant/color.dart';


class BrandDetails extends ConsumerWidget {
  final String brandName;

  BrandDetails({super.key, required this.brandName});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final apiStatus = ref.watch(homeNotifierProvider);
    final phones = ref.read(homeNotifierProvider.notifier).phones;

    if (apiStatus == ApiStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (apiStatus == ApiStatus.error) {
      return const Center(child: Text("Failed to load phones"));
    } else if (phones.isEmpty) {
      return const Center(child: Text("No phones available"));
    }

    // Responsive grid column count
    int crossAxisCount = 2;
    if (width >= 600 && width < 1024) {
      crossAxisCount = 3; // Tablet
    } else if (width >= 1024) {
      crossAxisCount = 8; // Web/Desktop
    }

    //  Responsive font and image sizes
    double imageSize = width < 600
        ? 80
        : width < 1024
        ? 100
        : 120;
    double fontSize = width < 600
        ? 12
        : width < 1024
        ? 8
        : 10;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          "$brandName Phones",
          style: TextStyle(
            fontSize: width < 600 ? 18 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: phones.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final brand = phones[index];
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  "productService",
                  extra: {
                    'name': brand.modelName,
                    'image': brand.modelImage,
                  },
                );
              },
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        '${ApiConfig.baseUrl}/${brand.modelImage}',
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        brand.modelName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
