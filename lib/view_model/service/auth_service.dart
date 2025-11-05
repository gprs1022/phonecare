import 'package:hive/hive.dart';

import '../../models/user_model.dart';
import 'api_client.dart';
import 'api_config.dart';

class AuthService {
  Future<EmailModel> loginUser(String email) async {
    final response = await ApiClient.dio.post(
      ApiConfig.login,
      data: {'email': email},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return EmailModel.fromJson(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<VerifyOtpModel> verifyOtp(String email, String otp) async {
    final response = await ApiClient.dio.post(
      ApiConfig.verifyOtp,
      data: {'email': email, 'otp': otp},
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final model = VerifyOtpModel.fromJson(response.data);

        await saveTokens(model);
        print(model.accessToken);
        print(model.refreshToken);
        return model;
      } else {
        final serverMessage = response.data['message'];
        throw Exception(serverMessage);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //save token to hive
  Future<void> saveTokens(VerifyOtpModel model) async {
    final box = Hive.box('authBox');
    await box.put('accessToken', model.accessToken);
    await box.put('refreshToken', model.refreshToken);
    await box.put('userName', model.user?.name);
    await box.put('userEmail', model.user?.email);
    await box.put('userId', model.user?.id);
  }

  String? getAccessToken() {
    final box = Hive.box('authBox');
    return box.get('accessToken');
  }

  String? getRefreshToken() {
    final box = Hive.box('authBox');
    return box.get('refreshToken');
  }

  bool isLoggedIn() {
    final box = Hive.box('authBox');
    return box.get('accessToken') != null;
  }

  Future<void> logout() async {
    final box = Hive.box('authBox');
    await box.clear();
    print('User logged out and tokens cleared');
  }
}
