import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/constant/enums.dart';

import '../../view_model/controller/login_provider.dart';

class VerifyOtpMobile extends ConsumerWidget {
  const VerifyOtpMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen(loginTypeProvider, (previous, next) {
      if (next == AuthState.loggedIn) {
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

    double imageHeight;
    double imageWidth;
    double fontSize;
    double buttonHeight;
    double sizedBoxHeight;

    if(width > 360) {
      imageWidth = 150;
      imageHeight = 150;
      fontSize = 10;
      buttonHeight = 30;
      sizedBoxHeight = 20;
    } else if(width < 600){
      imageWidth =180;
      imageHeight = 180;
      fontSize = 12;
      buttonHeight = 40;
      sizedBoxHeight = 30;
    } else {
      imageWidth = 200;
      imageHeight = 200;
      fontSize = 14;
      buttonHeight = 50;
      sizedBoxHeight = 40;
    }

    return Scaffold(
        body: Padding(padding: const EdgeInsets.all(20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset('assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
              SizedBox(height: sizedBoxHeight,),
              Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize:fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
              ),
              SizedBox(height: sizedBoxHeight,),
              TextFormField(
                controller: ref.watch(loginTypeProvider.notifier).otpController,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  prefixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              SizedBox(height: fontSize,),
              SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(loginTypeProvider.notifier).verifyOtp();
                    },
                    child: Text(
                        'Verify Otp',
                        style: TextStyle(
                            fontSize:fontSize,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        )
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
