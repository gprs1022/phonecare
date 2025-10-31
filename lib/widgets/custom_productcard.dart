import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/models/accessories_model.dart';
import 'package:phonecare/view_model/service/api_config.dart';

import '../models/refurbished_model.dart';
import '../view_model/controller/darktheme_controller.dart';

class CustomProductCard extends ConsumerWidget {
  final dynamic productList;

  const CustomProductCard({super.key, required this.productList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    final size = MediaQuery.of(context).size;
    final width = size.width;

    double fontSize;
    double buttonHeight;

    if (width < 600) {
      fontSize = 10;
      buttonHeight = 30;
    } else if (width < 768) {
      fontSize = 12;
      buttonHeight = 35;
    } else if (width < 992) {
      fontSize = 14;
      buttonHeight = 40;
    } else if (width < 1200) {
      fontSize = 16;
      buttonHeight = 45;
    } else if (width < 1600) {
      fontSize = 18;
      buttonHeight = 50;
    } else {
      fontSize = 20;
      buttonHeight = 55;
    }

    final Color cardBackgroundColor = isDarkMode ? Colors.black : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color borderColor = isDarkMode ? Colors.grey.shade800 : Colors.black;
    String name = "";
    int price = 0;
    List<String> images = [];
    if (productList is AccessoriesModel) {
      name = productList.productName;
      price = productList.price;
      images = productList.images;
    } else if (productList is RefurbishedModel) {
      name = productList.productName;
      price = productList.price;
      images = productList.images;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardBackgroundColor,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                context.pushNamed("productdetails", extra: productList);
              },
              child: Card(
                color: cardBackgroundColor,
                clipBehavior: Clip.antiAlias,
                child: productList.images.isNotEmpty
                    ? Image.network(
                        '${ApiConfig.baseUrl}/${images.isEmpty ? images.first : ''}',
                        fit: BoxFit.contain,
                      )
                    : Container(),
              ),
            ),
          ),
          Divider(color: Colors.grey, thickness: 2, height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              price.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: SizedBox(
              height: buttonHeight,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
