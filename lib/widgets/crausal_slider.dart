import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/view_model/controller/home_provider.dart';
import 'package:phonecare/view_model/service/api_config.dart';

import '../constant/enums.dart';
import '../view_model/service/api_client.dart';

class CrausalSlider extends ConsumerStatefulWidget {
  const CrausalSlider({super.key});

  @override
  ConsumerState createState() => _CrausalSliderState();
}

class _CrausalSliderState extends ConsumerState<CrausalSlider> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifierProvider.notifier).getSlider();
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    // Responsive adjustments
    double height;
    double viewportFraction;

    if (width < 600) {
      //Mobile
      height = 200;
      viewportFraction = 0.85;
    } else if (width < 1024) {
      // Tablet
      height = 300;
      viewportFraction = 0.8;
    } else {
      // Web/Desktop
      height = 400;
      viewportFraction = 1.0;
    }

    final homeNotifier = ref.watch(homeNotifierProvider.notifier);
    final apiStaus = ref.watch(homeNotifierProvider);

    final List<String> images = homeNotifier.sliders.map((e) => '${ApiConfig.baseUrl}/${e.image}').toList();

     if(apiStaus == ApiStatus.loading) {
       return const Center(child: CircularProgressIndicator());
     } else if(apiStaus == ApiStatus.error) {
       return const Center(child: Text("Something went wrong"));
     } else if(images.isEmpty) {
       return const Center(child: Text("yaha koi photo nhai hai"));
     }



    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            height: height,
            enlargeCenterPage: true,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            viewportFraction: viewportFraction,
            scrollDirection: Axis.horizontal,
          ),
          items: images.map((item) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black, // Added theme-aware background color
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      item,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded /
                                (progress.expectedTotalBytes ?? 1)
                                : null,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        );
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


