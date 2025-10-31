import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/view_model/service/auth_service.dart';

class LoginNotifier extends Notifier<AuthState>{

  final AuthService authService = AuthService();
  late TextEditingController emailController;
  late TextEditingController otpController;
  String? errorMessage;

  @override
  AuthState build(){
    emailController = TextEditingController();
    otpController = TextEditingController();

    ref.onDispose( (){
      emailController.dispose();
      otpController.dispose();
    });
    return AuthState.idle;
  }

  Future<void> login() async {
    final email = emailController.text.trim();

    if(email.isEmpty){
      errorMessage = 'Please enter your email';
      state = AuthState.error;
      return;
    }
     try {
       state = AuthState.loading;
       await authService.loginUser(email);
       state = AuthState.otpSent;
     } catch (e) {
       errorMessage = e.toString().replaceAll('Exception: ', '');
       state = AuthState.error;
     }
  }

  Future<void> verifyOtp() async {
    final email = emailController.text.trim();
    final otpValue = otpController.text.trim();

    if(otpValue.isEmpty){
      errorMessage = 'Please enter your OTP';
      state = AuthState.error;
      return;
    }

    try {
       state = AuthState.loading;
       await authService.verifyOtp(email, otpValue);
       state = AuthState.loggedIn;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      state =  AuthState.error;
    }
  }

  Future<void> checkLogin() async {
    if(authService.isLoggedIn()){
      state = AuthState.loggedIn;
    }else{
      state = AuthState.loggedOut;
    }
  }

  Future<void> logout() async {
    await authService.logout();
    state = AuthState.loggedOut;
  }
}

final loginTypeProvider = NotifierProvider<LoginNotifier, AuthState>(
  LoginNotifier.new,
);
