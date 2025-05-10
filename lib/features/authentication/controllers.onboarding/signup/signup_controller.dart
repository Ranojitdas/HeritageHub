import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:HeritageHub/common/widgets/loaders/loaders.dart';
import 'package:HeritageHub/data/repositories/authentication/authentication_repository.dart';
import 'package:HeritageHub/data/repositories/user/user_model.dart';
import 'package:HeritageHub/data/repositories/user/user_repository.dart';
import 'package:HeritageHub/features/authentication/screens/signup/verify_email.dart';
import 'package:HeritageHub/utils/constants/image_strings.dart';
import 'package:HeritageHub/utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final cpa = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final userName = TextEditingController();
  final aadhar = TextEditingController();
  final mailing = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Preferences
  final preferences = [
    'HeritageHub News',
    'Exhibitions',
    'New Releases',
    'Cancellation',
    'Kalamkari Artwork',
    'Meenakari Jewelry',
    'Terracotta Sculpture',
    'Pattachitra Painting',
    'Bandhani Fabric',
    'Brassware Decor',
    'Gond Painting',
    'Muga Silk Saree',
    'Assam Handicraft',
  ].obs;
  final selectedPreferences = <String>[].obs;

  /// Images associated with preferences
  final Map<String, String> preferenceImages = {
    'HeritageHub News': TImages.productImage5,
    'Exhibitions': TImages.productImage7,
    'New Releases': TImages.productImage8,
    'Cancellation': TImages.productImage9,
    'Kalamkari Artwork': TImages.productImage2,
    'Meenakari Jewelry': TImages.productImage5,
    'Terracotta Sculpture': TImages.productImage3,
    'Pattachitra Painting': TImages.productImage4,
    'Bandhani Fabric': TImages.productImage6,
    'Brassware Decor': TImages.productImage7,
    'Gond Painting': TImages.productImage8,
    'Muga Silk Saree': TImages.productImage9,
    'Assam Handicraft': TImages.productImage10,
  };

  /// Get dynamic title based on preferences
  String getDynamicTitle() {
    return selectedPreferences.isEmpty
        ? 'Select a Preference'
        : selectedPreferences.join(', ');
  }

  /// Get dynamic image based on preferences
  String getDynamicImage() {
    if (selectedPreferences.isEmpty) {
      return TImages.productImage1; // Default image
    }
    return preferenceImages[selectedPreferences.first] ?? TImages.productImage1;
  }

  /// Sign-Up Functionality
  void signup() async {
    try {
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      // Form validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'You must accept the Privacy Policy & Terms of Use to create an account.',
        );
        return;
      }

      // CPA account check
      if (!cpa.value) {
        TLoaders.warningSnackBar(
          duration: 6,
          title: 'Please Pay the Amount',
          message: 'You must pay the amount to create an NPDA account.',
        );
        return;
      }

      // Validate preference selection
      if (selectedPreferences.isEmpty) {
        TLoaders.warningSnackBar(
          title: 'Select Preferences',
          message: 'Please select at least one preference before proceeding.',
        );
        return;
      }

      // Register user in Firebase Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        aadhar: aadhar.text.trim(),
        mailing: mailing.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        preferences: selectedPreferences.toList(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show success message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message:
            'Your account has been created! Please verify your email to continue.',
      );

      // Navigate to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } on FirebaseAuthException catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.message ?? 'An error occurred. Please try again.',
      );
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: 'Something went wrong. Please try again later.',
      );
    }
  }

  /// Toggle preferences selection
  void togglePreference(String preference) {
    if (selectedPreferences.contains(preference)) {
      selectedPreferences.remove(preference);
    } else {
      selectedPreferences.add(preference);
    }
  }
}
