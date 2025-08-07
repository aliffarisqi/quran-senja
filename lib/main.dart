import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

/// The entry point of the Flutter application.
///
/// This is an asynchronous main function that ensures all necessary
/// initialization steps are completed before the app starts.
Future<void> main() async {
  // Ensure that the Flutter widget binding is initialized.
  // This is required for various low-level platform operations,
  // especially before calling native code or using plugins like GetStorage.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage.
  // This asynchronous call sets up the local storage for the application.
  await GetStorage.init();

  // Run the main application widget.
  // The app will not start until GetStorage.init() is completed.
  runApp(const App());
}
