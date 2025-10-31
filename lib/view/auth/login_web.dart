import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/constant/enums.dart';
import '../../view_model/controller/login_provider.dart';

class LoginWeb extends ConsumerStatefulWidget {
  const LoginWeb({super.key});

  @override
  ConsumerState createState() => _LoginWebState();
}

class _LoginWebState extends ConsumerState<LoginWeb> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loginTypeProvider.notifier).checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(loginTypeProvider, (previous, next) {
      if (next == AuthState.otpSent) {
        context.goNamed('verifyOtp');
      } else if (next == AuthState.loggedIn) {
        context.goNamed('bottomNav');
      } else if (next == AuthState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(ref.read(loginTypeProvider.notifier).errorMessage ?? 'An error occurred'),
          ),
        );
      }
    });

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double imageHeight;
    double imageWidth;
    double fontSize;
    double buttonHeight;
    double sizedBoxHeight;

    if (width < 360) {
      imageWidth = 150;
      imageHeight = 150;
      fontSize = 10;
      buttonHeight = 30;
      sizedBoxHeight = 20;
    } else if (width < 600) {
      imageWidth = 180;
      imageHeight = 180;
      fontSize = 12;
      buttonHeight = 40;
      sizedBoxHeight = 30;
    } else if (width < 1024) {
      imageWidth = 200;
      imageHeight = 200;
      fontSize = 14;
      buttonHeight = 50;
      sizedBoxHeight = 40;
    } else {
      imageWidth = 220;
      imageHeight = 220;
      fontSize = 16;
      buttonHeight = 60;
      sizedBoxHeight = 50;
    }

    return Scaffold(
      body: width >= 600
          ? Row(
        children: [
          Expanded(
            child: SizedBox(
              height: height,
              child: Image.asset(
                'assets/images/desktop.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: sizedBoxHeight,),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ),
                    SizedBox(height: sizedBoxHeight,),
                    Text('Welcome to Phone Care', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
                    SizedBox(height: sizedBoxHeight,),
                    TextFormField(
                      controller: ref.watch(loginTypeProvider.notifier).emailController,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: const Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: sizedBoxHeight,),
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(loginTypeProvider.notifier).login();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sizedBoxHeight,),
                    TextButton(
                      onPressed: () {
                        context.goNamed('terms-conditions');
                      },
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: sizedBoxHeight,),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ),
                    SizedBox(height: sizedBoxHeight,),
                    Text('Welcome to Phone Care', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
                    SizedBox(height: sizedBoxHeight,),
                    TextFormField(
                      controller: ref.watch(loginTypeProvider.notifier).emailController,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: const Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: sizedBoxHeight,),
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(loginTypeProvider.notifier).login();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sizedBoxHeight,),
                    TextButton(
                      onPressed: () {
                        context.goNamed('terms-conditions');
                      },
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
