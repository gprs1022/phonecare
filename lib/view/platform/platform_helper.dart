import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformHelper {
  /// Returns true if the app is running on the Web
  static bool get isWeb => kIsWeb;

  /// Returns true if the app is running on Android
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  /// Returns true if the app is running on iOS
  static bool get isIOS => !kIsWeb && Platform.isIOS;

  /// Returns true if the app is running on mobile (Android or iOS)
  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  /// Returns true if the app is running on Desktop (Mac, Windows, Linux)
  static bool get isDesktop =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
}
