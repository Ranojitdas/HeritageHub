import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:HeritageHub/app.dart';
import 'package:HeritageHub/data/repositories/authentication/authentication_repository.dart';
import 'package:HeritageHub/features/shop/screens/cart/widgets/cart_controller.dart';
import 'package:HeritageHub/firebase_options.dart';

/// Entry point
Future<void> main() async {
  // Add widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Local Storage
  await GetStorage.init();

  // Preserve splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Initialize CartController globally
  // Register CartController
  Get.put(CartController());


  // Run the app
  runApp(const App());
}
