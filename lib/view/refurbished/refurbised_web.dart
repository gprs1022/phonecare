import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/models/accessories_model.dart';
import 'package:phonecare/view_model/controller/refurbished_provider.dart';

import '../../constant/enums.dart';
import '../../widgets/custom_productcard.dart';

class RefurbisedWeb extends ConsumerStatefulWidget {
  const RefurbisedWeb({super.key});

  @override
  ConsumerState createState() => _RefurbisedWebState();
}

class _RefurbisedWebState extends ConsumerState<RefurbisedWeb> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(refurbishedNotifier.notifier).getRefurbishedProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final refurbishedNotifierInstance = ref.watch(refurbishedNotifier.notifier);
    final apiStatus = ref.watch(refurbishedNotifier);
    final productList = refurbishedNotifierInstance.refurishedList;

    if (apiStatus == ApiStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (apiStatus == ApiStatus.error) {
      return const Center(child: Text("Something Went Wrong"));
    } else if (productList.isEmpty) {
      return const Center(child: Text("No Data Found"));
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
      crossAxisCount = 7;
      childAspectRatio = 1.10;
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          final refurbishedProduct = productList[index];
          final accessoriesModel = AccessoriesModel(
            id: refurbishedProduct.id,
            productName: refurbishedProduct.productName,
            price: refurbishedProduct.price,
            images: refurbishedProduct.images,
            productDescription: refurbishedProduct.productDescription,
            rating: refurbishedProduct.rating,
            condition: refurbishedProduct.condition,
            brand: Brand(
              id: refurbishedProduct.brand?.id ?? '',
              name: refurbishedProduct.brand?.name ?? '',
            ),
            categoryId: '',
            storage: 0,
            battery: '',
            processor: '',
            ram: 0,
            originalPrice: 0,
          );
          return CustomProductCard(productList: accessoriesModel);
        },
      ),
    );
  }
}
