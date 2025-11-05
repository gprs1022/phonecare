import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends Notifier<bool> {
  @override
  bool build() => false;

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}

final authProvider = NotifierProvider<AuthProvider, bool>(() => AuthProvider());
