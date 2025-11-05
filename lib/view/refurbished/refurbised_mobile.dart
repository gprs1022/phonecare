import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/view_model/controller/refurbished_provider.dart';
import 'package:phonecare/widgets/custom_productcard.dart';

class RefurbisedMobile extends ConsumerStatefulWidget {
  const RefurbisedMobile({super.key});

  @override
  ConsumerState createState() => _RefurbisedMobileState();
}

class _RefurbisedMobileState extends ConsumerState<RefurbisedMobile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(refurbishedNotifier.notifier).getRefurbishedProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
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

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.transparent,
        ),
        child: GridView.builder(
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            final refurbishedProduct = productList[index];
            return CustomProductCard(
              productType: Products.refurbrished,
              refurbishedList: refurbishedProduct,
            );
          },
        ),
      ),
    );
  }
}
