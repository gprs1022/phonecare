import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/view_model/controller/home_provider.dart';
import 'package:phonecare/view_model/controller/login_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  List<double> listradius = [100, 150, 200, 250, 300];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    animation = Tween<double>(begin: 0.0, end: 2.0).animate(animationController)
      ..addListener(() {
        setState(() {}); // UI update
      });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ref.read(homeNotifierProvider.notifier).getSlider();
        ref.read(homeNotifierProvider.notifier).getBrands();
        ref.read(loginTypeProvider.notifier).checkLogin();
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(loginTypeProvider, (previous, next) {
      if (next == AuthState.loggedIn) {
        context.goNamed('bottomNav');
      } else if (next == AuthState.loggedOut) {
        context.goNamed('onboarding');
      }
    });

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    double imageWidth;
    double imageHeight;

    if (width < 600) {
      imageWidth = width * 0.45;
      imageHeight = height * 0.2;
    } else if (width < 1024) {
      imageWidth = width * 0.35;
      imageHeight = height * 0.25;
    } else {
      imageWidth = width * 0.25;
      imageHeight = height * 0.25;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            for (var radius in listradius) circleContainer(radius),
            ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                width: imageWidth,
                height: imageHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleContainer(double radius) {
    double opacity = (1.5 - animation.value).clamp(0.0, 1.0);
    return Container(
      width: radius * animation.value,
      height: radius * animation.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff04CEF7).withOpacity(opacity),
      ),
    );
  }
}
