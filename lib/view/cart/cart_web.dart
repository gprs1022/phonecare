import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/color.dart';
import '../../view_model/controller/darktheme_controller.dart';

class CartWeb extends ConsumerWidget {
  CartWeb({super.key});

  final List<Map<String, dynamic>> CartItem = [
    {
      "name": "Apple Iphone 14 Pro",
      "image":
          "https://s3ng.cashify.in/cashify/product/img/xhdpi/csh-yktr66ov-8tbh.png",
      "price": "45000",
    },
    {
      "name": "Samsung Galaxy S23 Ultra",
      "image":
          "https://s3ng.cashify.in/cashify/product/img/xhdpi/csh-yktr66ov-8tbh.png",
      "price": "55000",
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final width = MediaQuery.of(context).size.width;

    double cartItemHeight;
    double imageSize;
    double titleFontSize;
    double priceFontSize;
    double buttonFontSize;
    double iconButtonSize;
    double horizontalPadding;
    double itemInnerPadding;
    double summaryVerticalSpacing; // New responsive spacing
    double checkoutButtonVerticalPadding;

    if (width < 600) {
      // Mobile-like on web (narrow window)
      cartItemHeight = 100;
      imageSize = 80;
      titleFontSize = 14;
      priceFontSize = 12;
      buttonFontSize = 14;
      iconButtonSize = 20;
      horizontalPadding = 6.0;
      itemInnerPadding = 4.0;
      summaryVerticalSpacing = 10.0; // Smaller spacing
      checkoutButtonVerticalPadding = 8.0;
    } else if (width < 1024) {
      // Tablet-like on web
      cartItemHeight = 120;
      imageSize = 100;
      titleFontSize = 16;
      priceFontSize = 14;
      buttonFontSize = 16;
      iconButtonSize = 24;
      horizontalPadding = 8.0;
      itemInnerPadding = 6.0;
      summaryVerticalSpacing = 15.0; // Medium spacing
      checkoutButtonVerticalPadding = 10.0;
    } else {
      // Desktop-like on web
      cartItemHeight = 150;
      imageSize = 120;
      titleFontSize = 18;
      priceFontSize = 16;
      buttonFontSize = 18;
      iconButtonSize = 28;
      horizontalPadding = 20.0;
      itemInnerPadding = 10.0;
      summaryVerticalSpacing = 20.0; // Standard spacing
      checkoutButtonVerticalPadding = 15.0;
    }

    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.background, // Theme-aware background
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).appBarTheme.backgroundColor, // Theme-aware background
        automaticallyImplyLeading: true,
        title: Text(
          'Cart',
          style: TextStyle(
            color: Theme.of(
              context,
            ).textTheme.titleLarge?.color, // Theme-aware text color
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: CartItem.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: cartItemHeight,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).cardColor, // Theme-aware background color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        color: Theme.of(
                          context,
                        ).cardColor, // Theme-aware background color
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Theme.of(
                              context,
                            ).dividerColor, // Theme-aware divider color
                          ),
                        ),
                        child: Row(
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                CartItem[index]["image"], // Use actual image from list
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit
                                    .contain, // Ensure full image is visible
                              ),
                            ),
                            Expanded(
                              // Allow text column to take available space
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      CartItem[index]["name"], // Use actual name from list
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: titleFontSize,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color, // Theme-aware text color
                                      ),
                                    ),
                                    Text(
                                      CartItem[index]["price"], // Use actual price from list
                                      style: TextStyle(
                                        fontSize: priceFontSize,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color, // Theme-aware text color
                                      ),
                                    ),
                                    Spacer(), // Pushes quantity row to bottom
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .end, // Align quantity controls to the end
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.remove,
                                            size: iconButtonSize,
                                            color: Theme.of(
                                              context,
                                            ).iconTheme.color,
                                          ),
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                            fontSize: priceFontSize,
                                            color: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium?.color,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add,
                                            size: iconButtonSize,
                                            color: Theme.of(
                                              context,
                                            ).iconTheme.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            OrderSummary(
              titleFontSize: titleFontSize,
              priceFontSize: priceFontSize,
              buttonFontSize: buttonFontSize,
              horizontalPadding: horizontalPadding,
              summaryVerticalSpacing: summaryVerticalSpacing,
              checkoutButtonVerticalPadding: checkoutButtonVerticalPadding,
              cartItems: CartItem,
            ),
          ],
        ),
      ),
    );
  }

  Widget OrderSummery(
    BuildContext context,
    double fontSize,
    double buttonFontSize,
    double conButtonSize,
  ) {
    int total = CartItem.fold(0, (sum, item) => sum + int.parse(item["price"]));
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // Theme-aware background color
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).dividerColor, // Theme-aware divider color
        ),
      ),
      child: Column(
        children: [
          ...CartItem.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item["name"],
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  Text(
                    item["price"],
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              Text(
                '$total',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary, // Theme-aware background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ), // Add vertical padding for better button height
              ),
              child: Text(
                "Proceed to Checkout",
                style: TextStyle(
                  fontSize: buttonFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimary, // Theme-aware text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSummary extends ConsumerWidget {
  final double titleFontSize;
  final double priceFontSize;
  final double buttonFontSize;
  final double horizontalPadding;
  final double summaryVerticalSpacing;
  final double checkoutButtonVerticalPadding;
  final List<Map<String, dynamic>> cartItems;

  const OrderSummary({
    Key? key,
    required this.titleFontSize,
    required this.priceFontSize,
    required this.buttonFontSize,
    required this.horizontalPadding,
    required this.summaryVerticalSpacing,
    required this.checkoutButtonVerticalPadding,
    required this.cartItems,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef) {
    return Container(
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Order Summary",
            style: TextStyle(
              fontSize: titleFontSize + 2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          SizedBox(height: summaryVerticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: priceFontSize,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              Text(
                "\$total", // Use calculated total for subtotal for now
                style: TextStyle(
                  fontSize: priceFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          SizedBox(height: summaryVerticalSpacing / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping",
                style: TextStyle(
                  fontSize: priceFontSize,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              Text(
                "Free",
                style: TextStyle(
                  fontSize: priceFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              Text(
                "\$total", // Use calculated total
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          SizedBox(height: summaryVerticalSpacing),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: checkoutButtonVerticalPadding,
                ),
              ),
              child: Text(
                "Proceed to Checkout",
                style: TextStyle(
                  fontSize: buttonFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
