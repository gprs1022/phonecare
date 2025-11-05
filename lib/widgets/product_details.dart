import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/models/accessories_model.dart';
import 'package:phonecare/models/refurbished_model.dart';

import '../constant/color.dart';
import '../constant/enums.dart';
import '../view_model/controller/darktheme_controller.dart';

final selectedImageProvider = StateProvider<String?>((ref) => '');

class ProductDetails extends ConsumerWidget {
  final AccessoriesModel? accessoriesList;
  final RefurbishedModel? refurbishedList;
  final Products productType;

  const ProductDetails({
    super.key,
    required this.productType,
    this.accessoriesList,
    this.refurbishedList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final name = productType == Products.accessary
        ? accessoriesList?.productName ?? ''
        : refurbishedList?.productName ?? '';
    final images = productType == Products.accessary
        ? accessoriesList?.images ?? []
        : refurbishedList?.images ?? [];
    final rating = productType == Products.accessary
        ? accessoriesList?.rating ?? 0
        : refurbishedList?.rating ?? 0;
    final price = productType == Products.accessary
        ? accessoriesList?.price ?? 0.0
        : refurbishedList?.price ?? 0.0;
    final description = productType == Products.accessary
        ? accessoriesList?.productDescription ?? ''
        : refurbishedList?.productDescription ?? '';
    final ram = refurbishedList?.ram;
    final storage = refurbishedList?.storage;
    final battery = refurbishedList?.battery;
    final processor = refurbishedList?.processor;
    final condition = refurbishedList?.condition;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final current = ref.read(selectedImageProvider);
      if ((current == null || current.isEmpty) && images.isNotEmpty) {
        ref.read(selectedImageProvider.notifier).state = images.first;
      }
    });

    final selectedImage = ref.watch(selectedImageProvider);

    return Scaffold(
      backgroundColor: AppColor.blueGrey,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        title: Text(name),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: isDarkMode ? Colors.black : Colors.white,
                border: Border.all(color: AppColor.primaryColor, width: 2),
              ),
              child: Card(
                child: selectedImage != null && selectedImage.isNotEmpty
                    ? Image.network(selectedImage, fit: BoxFit.cover)
                    : const Icon(Icons.broken_image, size: 50),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: images
                    .map(
                      (imageUrl) => _buildImagecards(() {
                        ref.read(selectedImageProvider.notifier).state =
                            imageUrl;
                      }, imageUrl),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            initialRating: rating.toDouble(),
                            maxRating: 5,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "₹$price",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "4.2K People Liked it",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: isDarkMode ? Colors.black : Colors.white,
                border: Border.all(color: AppColor.primaryColor, width: 2),
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          '$description',
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (productType == Products.refurbrished)
              Column(
                children: [
                  Text(
                    "Specification",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 10,
                      right: 20,
                      left: 20,
                      bottom: 10,
                    ),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: isDarkMode ? Colors.black : Colors.white,
                      border: Border.all(
                        color: AppColor.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSpecification("Ram : ${ram}gb"),
                                  _buildSpecification("Storage : ${storage}gb"),
                                  _buildSpecification("Battery : $battery"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSpecification("Processor : $processor"),
                                  _buildSpecification("Condition : $condition"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Add to cart",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagecards(VoidCallback onTap, String imageUrl) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final themeMode = ref.watch(darkthemeProvider);
        final isDarkMode = themeMode == ThemeMode.dark;
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isDarkMode ? Colors.black : Colors.white,
              border: Border.all(color: AppColor.primaryColor, width: 2),
            ),
            child: Card(child: Image.network(imageUrl, fit: BoxFit.cover)),
          ),
        );
      },
    );
  }

  Widget _buildSpecification(text) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}
