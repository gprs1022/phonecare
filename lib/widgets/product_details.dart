import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constant/color.dart';
import '../view_model/controller/darktheme_controller.dart';

class ProductDetails extends ConsumerWidget {
  final dynamic product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        title: Text(product.productName),
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
                child: Image.network(product.images.first, fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: product.images
                    .map((imageUrl) => _buildImagecards(() {}, imageUrl))
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
                            product.productName,
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
                            initialRating: product.rating.toDouble(),
                            maxRating: 5,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            product.rating.toString(),
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
                      "₹${product.price}",
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
                          product.productDescription,
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
              margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: isDarkMode ? Colors.black : Colors.white,
                border: Border.all(color: AppColor.primaryColor, width: 2),
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
                            _buildSpecification("Ram : ${product.ram}gb"),
                            _buildSpecification(
                              "Storage : ${product.storage}gb",
                            ),
                            _buildSpecification("Battery : ${product.battery}"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSpecification(
                              "Processor : ${product.processor}",
                            ),
                            _buildSpecification(
                              "Condition : ${product.condition}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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

  Widget _buildImagecards(onTap, imageUrl) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final themeMode = ref.watch(darkthemeProvider);
        final isDarkMode = themeMode == ThemeMode.dark;
        return Container(
          height: 80,
          width: 80,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: isDarkMode ? Colors.black : Colors.white,
            border: Border.all(color: AppColor.primaryColor, width: 2),
          ),
          child: Card(child: Image.network(imageUrl, fit: BoxFit.cover)),
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
