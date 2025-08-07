import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

/// A utility class for common device-related functionalities.
///
/// This class provides static methods to interact with device properties,
/// such as screen dimensions, keyboard visibility, system UI, and platform information.
class QSDeviceUtils {
  QSDeviceUtils._(); // Private constructor to prevent instantiation

  // --- Screen & UI Methods ---

  /// Checks if the device is in landscape orientation.
  /// Requires [BuildContext] to access device orientation.
  static bool isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Checks if the device is in portrait orientation.
  /// Requires [BuildContext] to access device orientation.
  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// Returns the total height of the screen.
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns the total width of the screen.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the device pixel ratio.
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  /// Returns the height of the status bar.
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Returns the standard height of a bottom navigation bar.
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Returns the standard height of an app bar.
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Returns the current height of the software keyboard.
  static double getKeyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  /// Checks if the software keyboard is currently visible.
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  // --- System UI & Feedback Methods ---

  /// Sets the system UI to full-screen or reverts to normal mode.
  ///
  /// Set [enable] to true for full-screen (immersive sticky) mode.
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// Sets the preferred device orientations.
  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) {
    return SystemChrome.setPreferredOrientations(orientations);
  }

  /// Hides the status bar.
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Shows the status bar.
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  /// Triggers a haptic vibration feedback.
  static void vibrate() {
    HapticFeedback.vibrate();
  }

  // --- Platform & Connectivity Methods ---

  /// Checks if the application is running on a physical device.
  static bool isPhysicalDevice() {
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Checks if the device has an active internet connection.
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Checks if the current platform is iOS.
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Checks if the current platform is Android.
  static bool isAndroid() {
    return Platform.isAndroid;
  }
}
